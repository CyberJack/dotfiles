#---[ Zsh settings ]----------------------------------------------------
# Path to your zsh configuration.
HOSTNAME=$(hostname)
ZSH=$HOME/.zsh

#---[ Exports ]---------------------------------------------------------
source $ZSH/exports.zsh

#---[ Path customization ]----------------------------------------------
export PATH="${HOME}/bin:${HOME}/go/bin:$PATH"

#---[ Load ZSH settings ]-----------------------------------------------
for config_file ($ZSH/conf/*.zsh); do
    source $config_file
done

#---[ Antigen ]---------------------------------------------------------
source ${ANTIGENPATH}/antigen.zsh
source ${ZSH}/antigen-modules.zsh

#---[ Cleanup ]---------------------------------------------------------
export LSCOLORS="ExGxFxDxCxDxDxhbhdacEc"

#---[ Welcome the user ]------------------------------------------------
clear
if [ -x /usr/bin/figlet ]; then
    echo -e "${lightgrey}";figlet -f small " Welcome, ${USER}"
else
    echo -e "\n${cyan}Welcome, ${USER}\n"
fi
echo -e "${red}Host:\t\t\t${cyan} $HOSTNAME";
echo -ne "${red}Today is:\t\t${cyan}" `date`; echo ""
echo -e "${red}Kernel Information: \t${cyan}" `uname -smr`
echo -ne "${red}Uptime is: \t${cyan}";upinfo;echo ""
