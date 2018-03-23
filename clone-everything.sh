#!/bin/bash

ln -s tools/clean-everything.sh
ln -s tools/deploy-everything.sh
ln -s tools/rebuild-everything.sh
mkdir -p public_html rpm
git clone https://github.com/dafrito/mod_rainback
cd mod_rainback && autoreconf -i && cd ..
git clone https://github.com/dafrito/rainback-doc doc
cd doc && autoreconf -i && cd ..
git clone https://github.com/dafrito/graph-js
cd graph-js && autoreconf -i && cd ..
git clone https://github.com/dafrito/libparsegraph
cd libparsegraph && autoreconf -i && cd ..
git clone https://github.com/dafrito/marla
cd marla && autoreconf -i && cd ..
git clone https://github.com/dafrito/server
cd server && make && cd ..
