#!/usr/bin/env bash

cwd=$(cd `dirname $0`; pwd)

for dir in *; do
    [[ ! -d $cwd/$dir ]] && continue

    cd $cwd/$dir
    echo $dir
    anaconda build submit --channel main --channel dev . || true
done
