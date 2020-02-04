#!/usr/bin/env bash

set -eo pipefail

TERM_SUPPORTS_COLORS=false

function info {
    [[ $TERM_SUPPORTS_COLORS = true ]] && echo -e "\033[0;32m$1\033[0m" || echo -e "$1"
}

function error {
    [[ $TERM_SUPPORTS_COLORS = true ]] && echo >&2 -e "\033[0;91m$1\033[0m" || echo >&2 -e "$1"
}

function ask {
    read -r -p "$(echo -e "${1}") [y/N]): "
    case $(echo "${REPLY}" | tr '[:upper:]' '[:lower:]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

function header {
    info "#############################"
    info "#    Installing dotfiles    #"
    info "#############################"
    echo
}

function checkIfTermSupportsColors {
    if command -v tput > /dev/null 2>&1 && [[ $(tput -T"$TERM" colors) -ge 8 ]]; then
        TERM_SUPPORTS_COLORS=true
    fi
}

function checkRequirements {
    command -v rsync >/dev/null 2>&1 || {
        error "The application \"rsync\" is required, but it's not installed. Aborting.";
        exit 1;
    }
}

function checkForcedInstall {
    if [[ "$1" = "--force" || "$1" = "-f" ]]; then
        info "Force installing dotfiles!. Any existing files will be overwritten!"
        return
    fi

    if [[ -f "${HOME}/.zshrc" ]]; then
        if [[ "yes" != $(ask "A zsh configuration already exists.\nContinuing will overwrite the existing configuration. Are you sure?") ]]; then
            info "Aborting"
            echo
            exit 0
        fi
        echo
    fi
}

function sync {
    info "Installing dotfiles"
    rsync -avhq \
        --no-perms \
        --exclude ".env" \
        --exclude ".env.dist" \
        --exclude ".git/" \
        --exclude ".gitignore" \
        --exclude "install.sh" \
        --exclude "README.md" \
        ./ \
        "${HOME}/"

    echo
    info "Dotfiles have been installed.\nRestart your terminal or (re)start ZSH and enjoy!"
}

function postProcess {
    if [[ -f ".env" ]]; then
        set -o allexport
        source ".env"
        set +o allexport

        if [[ -n "${INSTALL_GIT_USER}" && -n "${INSTALL_GIT_EMAIL}" ]]; then
            addGitUserSection
        fi
    fi
}

function addGitUserSection {
    info "Adding [user] section to git configuration"
    echo -e "[user]\n    name = ${INSTALL_GIT_USER}\n    email = ${INSTALL_GIT_EMAIL}\n" | cat - "${HOME}"/.gitconfig > /tmp/installer_$$ && mv /tmp/installer_$$ "${HOME}"/.gitconfig
}

checkIfTermSupportsColors
header
checkRequirements
checkForcedInstall "${1:-false}"
sync
postProcess
