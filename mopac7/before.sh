#!/bin/bash

source ../common.sh

if [[ "$OS_NAME" == Linux ]]; then
    sudo apt update
    sudo apt install -y gfortran-4.8
elif [[ "$OS_NAME" == MacOSX ]]; then
    for pkg in gcc coreutils; do
        if brew list $pkg &> /dev/null; then
	    brew upgrade $pkg || true
	else
	    brew install $pkg
	fi
    done
fi
