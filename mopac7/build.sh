#!/bin/bash

# apt update
# apt install -y gfortran-4.8 make libtool automake autoconf

# brew install gcc

if [[ $(uname) == Linux ]]; then
    export F77=gfortran-4.8
    export CC=gcc-4.8
else
    export F77=gfortran
    export CC=gcc

    cat <<EOF > test.f90
program test
end program test
EOF

    $F77 test.f90 -o test
    LIBQUADMATH=$(otool -L ./test | awk '/libquadmath/ {print $1}')
fi


./autogen.sh

./configure --disable-dependency-tracking --disable-shared --prefix=$PREFIX

make -j `nproc`

mkdir -p $PREFIX/bin/
sed -i.bak 's#./fortran/mopac7#$(dirname $0)/mopac7#' run_mopac7

cp -a run_mopac7 $PREFIX/bin

cd fortran

if [[ $(uname) == Linux ]]; then
    $F77 -static -std=legacy -fno-automatic -o $PREFIX/bin/mopac7 mopac7app.o  ./.libs/libmopac7.a -lm
else
    mv $LIBQUADMATH $LIBQUADMATH.bak
    $F77 -static-libgcc -static-libgfortran -g -O2 -std=legacy -fno-automatic -o $PREFIX/bin/mopac7 mopac7app.o  ./.libs/libmopac7.a -lm
    mv $LIBQUADMATH.bak $LIBQUADMATH
fi
