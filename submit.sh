#!/usr/bin/env bash

set -e

cwd=$(cd `dirname $0`; pwd)

if [[ $1 != "" ]]; then
    cd $cwd/$1
    anaconda build submit --channel main --channel dev . || true
elif [[ $1 == "." ]]; then
    anaconda build submit --channel main --channel dev . || true
else
    for dir in *; do
        [[ ! -d $cwd/$dir ]] && continue

        cd $cwd/$dir
        echo $dir
        anaconda build submit --channel main --channel dev . || true
    done
fi
