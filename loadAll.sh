#!/bin/bash
#script=$0
#basename="$(dirname $(readlink -f $script))"

if [ -e /usr/bin/sudo ]
then
    ADDSUDO="sudo "
else
    ADDSUDO=""
fi

alias ll='ls -lah'
alias edit_hosts=$SUDO'nano /etc/hosts'
alias reloadProfile='source ~/.bashrc'
alias update-linuxshortcuts='cd $LINUXSHORTCUTS_DIR && git pull origin && cd - && reloadProfile'

# docker
docker_interactive () { docker exec -it $1 /bin/bash; }
