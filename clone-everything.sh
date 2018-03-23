#!/bin/bash

test -e clean-everything.sh || ln -s tools/clean-everything.sh
test -e deploy-everything.sh || ln -s tools/deploy-everything.sh
test -e rebuild-everything.sh || ln -s tools/rebuild-everything.sh
mkdir -p public_html rpm
test -d mod_rainback || git clone https://github.com/dafrito/mod_rainback
test -d doc || git clone https://github.com/dafrito/rainback-doc doc
cd doc && autoreconf -i && cd ..
test -d graph-js || git clone https://github.com/dafrito/graph-js
cd graph-js && autoreconf -i && cd ..
test -d libparsegraph || git clone https://github.com/dafrito/libparsegraph
cd libparsegraph && autoreconf -i && cd ..
test -d marla || git clone https://github.com/dafrito/marla-server marla
cd marla && autoreconf -i && cd ..
test -d server || git clone https://github.com/dafrito/rainback-server-httpd server
cd server && make && cd ..
