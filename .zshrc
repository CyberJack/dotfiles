# vim:foldlevel=0
# vim:foldmethod=marker

# Start profiler
if [[ "${ZSH_PROFILE}" == 1 ]]; then
  zmodload zsh/zprof
else
  ZSH_PROFILE=0
fi

# Zinit {{{
ZINIT_HOME="${XDG_DATA_HOME:-${HOME:-~/.local/share}}/zinit"

if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME/repo"
fi

source "${ZINIT_HOME}/repo/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-bin-gem-node
    
# Prezto {{{
zinit snippet PZT::modules/environment/init.zsh
zinit snippet PZT::modules/gnu-utility/init.zsh

zstyle ':prezto:module:utility' safe-ops 'no'
zinit snippet PZTM::utility

zinit ice wait'1' lucid; zinit snippet PZT::modules/directory/init.zsh
zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/completion/init.zsh
zinit snippet PZT::modules/osx/init.zsh
zinit snippet PZT::modules/gpg/init.zsh

zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:editor' ps-context 'yes'
zstyle ':prezto:module:prompt' managed 'yes'
zinit snippet PZTM::editor

zstyle ':prezto:module:terminal' auto-title 'yes'
zinit snippet PZT::modules/terminal/init.zsh
# }}}

zinit ice lucid atload"unalias gcd"
zinit snippet OMZP::git

zinit ice from"gh-r" as"program" \
  cp"posh-* -> oh-my-posh" \
  pick"oh-my-posh"
zinit light JanDeDobbeleer/oh-my-posh

zinit ice wait'0' blockf lucid
zinit light zsh-users/zsh-completions

# https://github.com/zdharma-continuum/zinit-packages/tree/main/fzf
zinit pack"bgn-binary+keys" for fzf

zinit ice depth"1" \
  pick"shell_integration/zsh" \
  sbin"utilities/*" if"[[ $+ITERM_PROFILE ]]"
zinit load gnachman/iTerm2-shell-integration

# https://github.com/zdharma-continuum/zinit-packages/tree/main/dircolors-material
# zinit pack"no-color-swaps" for dircolors-material

# https://github.com/zdharma-continuum/zinit-packages/tree/main/ls_colors
zinit pack"no-color-swaps" for dircolors-material

zinit wait lucid for \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  atinit"zpcompinit;zpcdreplay" zdharma-continuum/fast-syntax-highlighting

# End Profiler
if [[ "${ZSH_PROFILE}" == 1 ]]; then
  zprof | less
fi

autoload -Uz compinit

if [ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]; then
  compinit;
else
  compinit -C;
fi

# FZF {{{
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d ."
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# }}}

export HOMEBREW_NO_ANALYTICS=1
export KEYTIMEOUT=1

for file in ${HOME}/.zsh/*.zsh; do
  source $file
done

# Welcome
if type "cowsay" > /dev/null; then
  if type "fortune" > /dev/null; then
    if type "clear" > /dev/null; then
      clear
    fi
	
    fortune -s | cowsay -W 80 -f moose -y
    echo -e "${red}Host:\t\t\t${cyan} $HOSTNAME";
    echo -ne "${red}Today is:\t\t${cyan}" `date`; echo ""
    echo -e "${red}Kernel Information: \t${cyan}" `uname -smr`
    echo -ne "${red}Uptime is: \t${cyan}"; upinfo; echo ""
  fi
fi
