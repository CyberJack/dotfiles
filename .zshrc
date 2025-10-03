# zmodload zsh/zprof

#
# Zinit
# 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f ${ZINIT_HOME}/zinit.zsh ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

    if [[ ! -d $(dirname $ZINIT_HOME)/polaris/bin ]]; then
        mkdir -p $(dirname $ZINIT_HOME)/polaris/bin
    fi
fi

source "${ZINIT_HOME}/zinit.zsh"

#autoload -Uz _zinit
#(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node

#
# General settings
#
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

#
# History
#
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

#
# FZF
#
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude .idea"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="fd -t d ."
export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers,changes --wrap never --color always {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --bind '?:toggle-preview' --bind 'enter:execute(vim {+} < /dev/tty)+abort'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:5:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | clip.exe)+abort' --color header:italic --header 'Press CTRL-Y to copy command into clipboard'"

#
# Colors
#
export black='\e[0;30m'
export blue='\e[0;34m'
export green='\e[0;32m'
export cyan='\e[0;36m'
export red='\e[0;31m'
export purple='\e[0;35m'
export brown='\e[0;33m'
export lightgray='\e[0;37m'
export darkgray='\e[1;30m'
export lightblue='\e[1;34m'
export lightgreen='\e[1;32m'
export lightcyan='\e[1;36m'
export lightred='\e[1;31m'
export lightpurple='\e[1;35m'
export yellow='\e[1;33m'
export white='\e[1;37m'
export nc='\e[0m'

#
# Prompt
#
zinit lucid from'gh-r' as'null' for \
    id-as'oh-my-posh' \
        mv'posh-* -> oh-my-posh' \
        sbin"oh-my-posh" \
        atload'eval "$(oh-my-posh init zsh --config ${HOME}/.zsh/themes/theme.omp.json)"' \
        @JanDeDobbeleer/oh-my-posh

#
# Oh My Zsh libs
# https://github.com/ohmyzsh/ohmyzsh/tree/master/lib
#
zinit light-mode for \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::correction.zsh \
    OMZL::functions.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::key-bindings.zsh \
    OMZL::spectrum.zsh \
    OMZL::termsupport.zsh

#
# Programs
#
zinit as'null' depth'1' wait'0a' lucid from='gh-r' light-mode for \
    id-as'age' \
        sbin'**/age*' \
        @FiloSottile/age \
    id-as'asdf' \
        sbin'asdf' \
        atclone'./*sdf completion zsh > _asdf && zinit creinstall -q .' \
        @asdf-vm/asdf \
    id-as'bat' \
        sbin"**/bat" \
        atclone'mv bat*/autocomplete/bat.zsh _bat && zinit creinstall -q .' \
        atpull'%atclone' \
        atload'export MANPAGER="bat --plain"' \
        @sharkdp/bat \
    id-as'delta' \
        sbin'**/delta' \
        atclone'./*/delta --generate-completion zsh > _delta && zinit creinstall -q .' \
        atpull'%atclone' \
        @dandavison/delta \
    id-as'doggo' \
        sbin'**/doggo' \
        atclone'./do*/doggo completions zsh > _doggo && zinit creinstall -q .' \
        atpull'%atclone' \
        nocompile \
        @mr-karan/doggo \
    id-as'duf' \
        sbin'**/duf' \
        @muesli/duf \
    id-as'dust' \
        sbin'**/dust' \
        @bootandy/dust \
    id-as'fd' \
        sbin"**/fd" \
        atclone'mv fd*/autocomplete/_fd . && zinit creinstall -q .' \
        atpull'%atclone' \
        @sharkdp/fd \
    id-as'fzf' \
        sbin'fzf' \
        atclone'./fzf --zsh > fzf.zsh' \
        atpull'%atclone' \
        src'fzf.zsh' \
        @junegunn/fzf \
    id-as'glow' \
        sbin'**/glow' \
        atclone'mv glow*/completions/glow.zsh _glow && zinit creinstall -q .' \
        atpull'%atclone' \
        @charmbracelet/glow  \
    id-as'hyperfine' \
        sbin'**/hyperfine' \
        atclone'mv hy*/autocomplete/_hyperfine . && zinit creinstall -q .' \
        atpull'%atclone' \
        @sharkdp/hyperfine \
    id-as'jq' \
        sbin'* -> jq' \
        nocompile \
        @jqlang/jq \
    id-as'lsd' \
        sbin"lsd" \
        atclone'mv lsd*/autocomplete/_lsd . && zinit creinstall -q .' \
        atpull'%atclone' \
        @lsd-rs/lsd \
    id-as'micro' \
        sbin"**/micro" \
        @zyedidia/micro \
    id-as'ripgrep' \
        sbin'**/rg' \
        atclone'mv ripgrep*/complete/_rg . && zinit creinstall -q .' \
        atpull'%atclone' \
        @BurntSushi/ripgrep \
    id-as'superfile' \
        sbin'**/spf' \
        @yorukot/superfile \
    id-as'zoxide' \
        sbin'**/zoxide' \
        atclone'./zoxide init zsh > init.zsh && mv completions/_zoxide . && zinit creinstall -q .' \
        atpull'%atclone' \
        src'init.zsh' \
        nocompile'!' \
        @ajeetdsouza/zoxide

#
# Missing completions for plugins
#
zinit as'completion' depth'1' wait'0a' lucid for \
    https://raw.githubusercontent.com/bootandy/dust/refs/heads/master/completions/_dust

#
# Oh My Zsh plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
# 
zinit wait'0b' lucid light-mode for \
    OMZP::catimg \
    OMZP::command-not-found \
    OMZP::extract \
    OMZP::safe-paste \
    OMZP::ssh-agent \
    OMZP::systemd

#
# Plugins
#
zinit depth'1' wait'0c' lucid light-mode for \
    id-as'alias-tips' \
        @djui/alias-tips \
    id-as'toggle-command-prefix' \
        @xPMo/zsh-toggle-command-prefix

zinit depth'1' wait'0d' lucid light-mode for \
    id-as'fast-syntax-highlighting' \
        @zdharma-continuum/fast-syntax-highlighting \
    id-as'zsh-autosuggestions' \
        atload'!_zsh_autosuggest_start' \
        @zsh-users/zsh-autosuggestions

zinit depth'1' wait'0e' lucid light-mode for \
    id-as'zsh-completions' \
        blockf \
        atpull'zinit creinstall -q .' \
        atload'zicompinit; zicdreplay' \
        @zsh-users/zsh-completions

#
# Disable highlighting of text pasted into the command line
#
zle_highlight=('paste:none')

#
# Settings
#
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent lazy yes
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

#
# Aliasses
#
alias ls='lsd'
alias ll='lsd -alFhg --header --date +"%d %b %Y %T" --git'

export EDITOR="vim"

#
# Functions
#
[[ -f ${HOME}/.zsh/functions.zsh ]] && source ${HOME}/.zsh/functions.zsh

# https://wiki.archlinux.org/index.php/zsh#Persistent_rehash
zstyle ':completion:*' rehash true

# Welcome
if type "cowsay" > /dev/null; then
    if type "fortune" > /dev/null; then
#        if type "clear" > /dev/null; then
#            clear
#        fi

        fortune -s | cowsay -W 80 -f moose -y
        echo -e "${red}Host:\t\t\t${cyan} $HOSTNAME";
        echo -ne "${red}Today is:\t\t${cyan}" `date`; echo ""
        echo -e "${red}Kernel Information: \t${cyan}" `uname -smr`
        echo -ne "${red}Uptime is: \t${cyan}"; upinfo; echo ""
    fi
fi

# zprof
