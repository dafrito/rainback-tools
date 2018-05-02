#!/bin/bash

rsync -Lavzih $* $HOME/src/rainback/rpm/ notime:/srv/rpm
ssh notime '/bin/bash -c "/usr/bin/createrepo --update /srv/rpm"'
