#---[ Functions ]-------------------------------------------------------

# Uptime and load info
function upinfo () {
  echo -ne "\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13}'
}

# Easy extract
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvJf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Create a tar archive from given directory
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

# Starts a server on port 8000 that makes the current directory browsable
function webshare() {
  python -m "$(python -c 'import sys; print("http.server" if sys.version_info[:2] > (2,7) else "SimpleHTTPServer")')"
}
