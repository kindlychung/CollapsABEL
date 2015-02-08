#!/usr/bin/env bash

if [[ $(uname -a) == *"Ubuntu"* ]]; then
    sudo apt-get -y install r-base git libboost-system-dev libboost-filesystem-dev libboost-program-options-dev
elif [[ $(ls /etc/*-release) == *"fedora-release"*  ]] then

fi
cd /tmp
git clone https://kindlychung@bitbucket.org/kindlychung/bedcoll.git
cd bedcoll/
./build.sh
sudo cp bedcoll /usr/local/bin/
