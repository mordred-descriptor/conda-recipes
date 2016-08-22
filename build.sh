#!/bin/bash

for base in *; do
    [[ -f $base ]] && continue

    cd $base
    conda build . --python $PYTHON_VERSION --token $ANACONDA_CLOUD_TOKEN
    cd ..
done
