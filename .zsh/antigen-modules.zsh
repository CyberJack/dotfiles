#---[ Load the oh-my-zsh's library ]------------------------------------

antigen use oh-my-zsh

# Install bundles
antigen bundles <<EOBUNDLES
  git
  git-flow
  git-flow-avh
  docker
  docker-compose
  go
  sudo
  fzf
  command-not-found
  z
  composer
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
EOBUNDLES

case "$OSTYPE" in
  linux*)
    antigen bundle systemd
    ;;
  darwin*)
    antigen bundle iterm2
    ;;
esac

# Antigen doesn't do automatic updates like oh-my-zsh. This plugin adds
# auto updating for antigen, both of antigen and the bundles loaded in
# your configuration
# antigen bundle unixorn/autoupdate-antigen.zshplugin

# An opinionated git prompt for bash and zsh
# antigen bundle antigen-bundle arialdomartini/oh-my-git

#---[ Load the theme ]--------------------------------------------------
antigen theme ys

#---[ Load extras ]-----------------------------------------------------
if [ -f "${ZSH}/extra/antigen-modules.zsh" ]; then
  # shellcheck source=.zsh/extra/antigen-modules.zsh
  source "${ZSH}/extra/antigen-modules.zsh"
fi

#---[ Tell antigen that you're done ]-----------------------------------
antigen apply
