#---[ Aliasses ]--------------------------------------------------------

# Super User
alias _='sudo'

# Directory listings
alias ll='ls -alFh'

# scp with resume support
alias scpresume='rsync --partial --progress'

if [[ "$OSTYPE" == darwin* ]] ; then
  alias brewp='brew pin'
  alias brews='brew list -1'
  alias brewsp='brew list --pinned'
  alias bubo='brew update && brew outdated'
  alias bubc='brew upgrade && brew cleanup'
  alias bubu='bubo && bubc'
  alias bcubo='brew update && brew cask outdated'
  alias bcubc='brew cask reinstall $(brew cask outdated) && brew cleanup'
fi
