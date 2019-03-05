#!/bin/bash

set -e

for base in *; do
    if [[ -f $base ]]; then
        continue
    fi

    cd $base
    if [[ -f before.sh ]]; then
        bash before.sh
    fi
    conda build . --python $PYTHON_VERSION --token $ANACONDA_CLOUD_TOKEN
    cd ..
done
