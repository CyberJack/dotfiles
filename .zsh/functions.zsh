#
# Functions
#
function mktar() {
  tar cvf  "${1%%/}.tar" "${1%%/}/";
}

# Create a tar.gz archive from given directory
function mktgz() {
  tar cvzf "${1%%/}.tar.gz" "${1%%/}/";
}

# Create a tar.bz2 archive from given directory
function mktbz() {
  tar cvjf "${1%%/}.tar.bz2" "${1%%/}/";
}

function upinfo () {
  echo -ne "\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13}'
}

spf() {
  os=$(uname -s)

  # Linux
  if [[ "$os" == "Linux" ]]; then
      export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
  fi

  # macOS
  if [[ "$os" == "Darwin" ]]; then
      export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
  fi

  command spf "$@"

  [ ! -f "$SPF_LAST_DIR" ] || {
      . "$SPF_LAST_DIR"
      rm -f -- "$SPF_LAST_DIR" > /dev/null
  }
}

#
# Allow Midnight Commander to quit into last used directory
#
if [[ -d "/opt/homebrew/Cellar" ]]; then
    . /opt/homebrew/Cellar/midnight-commander/**/libexec/mc/mc.sh
elif [[ -d "/usr/local/Cellar/midnight-commander" ]]; then
    . /usr/local/Cellar/midnight-commander/**/libexec/mc/mc.sh
elif [[ -f "/usr/local/mc/share/mc/bin/mc.sh" ]]; then
    . /usr/local/mc/share/mc/bin/mc.sh
elif [[ -f "/usr/local/share/mc/bin/mc.sh" ]]; then
    . /usr/local/share/mc/bin/mc.sh
elif [[ -f "/usr/share/mc/bin/mc.sh" ]]; then
    . /usr/share/mc/bin/mc.sh
elif [[ -f "/usr/lib/mc/mc.sh" ]]; then
    . /usr/lib/mc/mc.sh
fi

