#!/bin/bash
script=$0
basename="$(dirname $(readlink -f $script))"

if [ -e /usr/bin/sudo ]
then
    ADDSUDO="sudo "
else
    ADDSUDO=""
fi

UPDATE_LINK=/usr/bin/update-linuxshortcuts

if [ -e  $UPDATE_LINK ]
then
    echo "Already installed!"
    exit
else
    CMD="ln -s $basename/update.sh $UPDATE_LINK"
    $ADDSUDO$CMD
    echo "source $basename/loadAll.sh">>~/.bashrc

    CRONBKP=/tmp/crontab_backup
    crontab -l > $CRONBKP
    echo "@hourly /usr/bin/update-linuxshortcuts" >> $CRONBKP
    crontab $CRONBKP
    echo "DONE! $(date)"
fi