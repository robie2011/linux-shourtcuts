#!/bin/bash
script=$0
basename="$(dirname $(readlink -f $script))"

cd $basename
git pull
reloadProfile
cd -