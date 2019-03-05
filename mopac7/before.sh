#!/bin/bash

source ../common.sh

if [[ "$OS_NAME" == Linux ]]; then
    apt install -y gfortran-4.8
elif [[ "$OS_NAME" == MacOSX ]]; then
    brew install gcc
fi
