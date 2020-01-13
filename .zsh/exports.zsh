#---[ Exports ]---------------------------------------------------------

export GOPATH=$HOME/go
export EDITOR=vim
export ANTIGENPATH=/usr/share/zsh/share

#---[ Load extras ]-----------------------------------------------------
if [ -f "${ZSH}/extra/exports.zsh" ]; then
  # shellcheck source=.zsh/extra/exports.zsh
  source "${ZSH}/extra/exports.zsh"
fi
