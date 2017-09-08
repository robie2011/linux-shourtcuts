#!/bin/bash


if [ -e /usr/bin/sudo ]
then
    ADDSUDO="sudo "
else
    ADDSUDO=""
fi

alias ll='ls -lah'
alias edit_hosts=$SUDO'nano /etc/hosts'
alias reloadProfile='source ~/.bashrc'