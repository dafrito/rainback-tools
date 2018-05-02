#!/bin/bash

for d in libparsegraph; do
    pushd $d || exit
    make clean || exit
    popd
done

for d in doc graph-js mod_rainback; do
    pushd $d || exit
    make clean || exit
    popd || exit
done

pushd server
make clean || exit
popd

pushd marla
make clean || exit
popd
