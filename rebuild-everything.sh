#!/bin/bash

for d in libparsegraph; do
    pushd $d || exit
    make && make install && make rpm || exit
    popd
done

for d in doc graph-js mod_rainback; do
    pushd $d || exit
    make || exit
    ./deploy.sh || exit
    make rpm || exit
    popd || exit
done

pushd marla-chroot
make
make rpm
popd

pushd server
make rpm || exit
make kill
make run
popd

pushd marla
make kill
make clean && make install || exit
make rpm || exit
make run
popd
