#!/bin/bash
str="deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"
filename="/etc/apt/sources.list"
if ! grep -w -q "$str" $filename; then
  echo $str >>$filename
fi
apt-get install dirmngr -y
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-get update
apt-get install ansible -y --allow-unauthenticated
