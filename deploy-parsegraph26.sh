#!/bin/bash

rsync -Lavzih $* $HOME/src/parsegraph/rpm/ dafrito.com:/srv/parsegraph26/rpm
#rsync -Lavzih --exclude='*~' $HOME/src/parsegraph/server/public_html/ dafrito.com:/srv/parsegraph26/html
ssh dafrito.com '/bin/bash -c "/usr/bin/createrepo --update /srv/parsegraph26/rpm"'
