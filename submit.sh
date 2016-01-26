#!/usr/bin/env bash

cwd=$(cd `dirname $0`; pwd)

for dir in *; do
    [[ ! -d $dir ]] && continue

    cd $cwd/$dir
    anaconda build submit --channel main .
done
