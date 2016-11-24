#!/bin/bash

# Author : Chirag Jain
# Copyright (c) Amaeka
# Script to install Python version 3.4 using source
# For Redhat, Cent0S and Fedora distros
# Script follows here

#1. GCC , wget is a prerequisites to install Python
verify_Package wget

#Check if wget,gcc installed or not
if rpm -q wget &> /dev/null ; then
#wget already installed
  rpm -q gcc &> /dev/null ; then
# GCC already installed
else
  yum install gcc -y
fi

# Function to verify if wget is present
function verify_Package() {
  if rpm -q $1 &> /dev/null ; then
    #wget already installed
    echo "$1 already installed"
  else
    echo "Installing $1 ------->"
    yum install $1 -y
    echo "----------$1 Successfully installed"
}

function downloadPython() {
    cd /usr/src
    wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
    tar xzf Python-3.4.3.tgz
    sleep 5
  }
