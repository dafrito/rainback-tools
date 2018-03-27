#!/bin/bash

mkdir -p ~/tmp
mkdir -p ~/lib/pkgconfig
mkdir -p ~/include

CHANGED=0

add_pkg_config() {
    echo 'PKG_CONFIG_PATH=$HOME/lib/pkgconfig' >>~/.bash_profile;
    CHANGED=1
}

add_library_path() {
    echo 'LD_LIBRARY_PATH=$HOME/lib' >>~/.bash_profile;
    CHANGED=1
}

grep -q PKG_CONFIG_PATH ~/.bash_profile ~/.bashrc || add_pkg_config
grep -q LD_LIBRARY_PATH ~/.bash_profile ~/.bashrc || add_library_path

if test $CHANGED -eq 1; then
    echo 'Run "source ~/.bash_profile" to load these configuration changes!' >&2
fi
