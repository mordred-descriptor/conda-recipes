#!/bin/bash

set -e

source ./common.sh

for base in *; do
    if [[ -f $base ]]; then
        continue
    fi

    if [[ -f $base/OS ]] && ! grep "$OS_NAME" $base/OS &> /dev/null; then
        continue
    fi

    cd $base
    if [[ -f before.sh ]]; then
        bash before.sh
    fi
    conda build . --python $PYTHON_VERSION --token $ANACONDA_CLOUD_TOKEN
    cd ..
done
