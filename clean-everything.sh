#!/bin/bash

pushd marla
make kill
make clean
pop

pushd server
make kill
make clean
popd

for d in libparsegraph_user libparsegraph_list libparsegraph_environment; do
    pushd $d
    #make clean && make && make install && make check
    make clean
    popd
done

for d in doc graph-js mod_rainback mod_environment_ws; do
    pushd $d
    make clean || exit
    #make || exit
    #./deploy.sh || exit
    popd
done

