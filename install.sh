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
    chmod +x $UPDATE_LINK
    echo "source $basename/loadAll.sh">>~/.bashrc

    CRONBKP=/tmp/crontab_backup
    crontab -l > $CRONBKP
    echo "@hourly $UPDATE_LINK" >> $CRONBKP
    crontab $CRONBKP
    echo "DONE! $(date)"
fi