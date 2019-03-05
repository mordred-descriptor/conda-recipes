#!/bin/bash

source ../common.sh

if [[ "$OS_NAME" == Linux ]]; then
    sudo apt update
    sudo apt install -y gfortran-4.8
elif [[ "$OS_NAME" == MacOSX ]]; then
    brew update
    brew install gcc
fi
