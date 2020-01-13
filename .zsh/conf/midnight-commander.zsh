#---[ Midnight Commander settings ]-------------------------------------

# Allow Midnight Commander to quit into last used directory
if [[ -d "/usr/local/Cellar/midnight-commander" ]]; then
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
