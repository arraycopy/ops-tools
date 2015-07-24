#!/bin/bash

function addRpmforgeResource(){
        wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
        sudo rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
        rm -f rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
}

function installTools(){
        sudo yum install -y htop
}

echo "please select your choose"
echo "which do you want to?input the number."
echo "1. install htop"
echo "2. install htop"
read input

case "$input" in
[1])
        addRpmforgeResource
        installTools
;;
[2])
        addRpmforgeResource
        installTools
;;
*) echo "nothing,exit";;
esac
