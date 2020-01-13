#---[ Directory settings ]----------------------------------------------

# changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt auto_param_slash
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Alertnate cd
function smart_cd () {
    if [[ -f $1 ]] ; then
        [[ ! -e ${1:h} ]] && return 1
        print correcting ${1} to ${1:h}
        builtin cd ${1:h}
    else
        builtin cd ${1}
    fi
}

function cd () {
    setopt localoptions
    setopt extendedglob
    local approx1 ; approx1=()
    local approx2 ; approx2=()
    if (( ${#*} == 0 )) || [[ ${1} = [+-]* ]] ; then
        builtin cd "$@"
    elif (( ${#*} == 1 )) ; then
        approx1=( (#a1)${1}(N) )
        approx2=( (#a2)${1}(N) )
        if [[ -e ${1} ]] ; then
            smart_cd ${1}
        elif [[ ${#approx1} -eq 1 ]] ; then
            print correcting ${1} to ${approx1[1]}
            smart_cd ${approx1[1]}
        elif [[ ${#approx2} -eq 1 ]] ; then
            print correcting ${1} to ${approx2[1]}
            smart_cd ${approx2[1]}
        else
            print couldn\'t correct ${1}
        fi
    elif (( ${#*} == 2 )) ; then
        builtin cd $1 $2
    else
        print cd: too many arguments
    fi
}
