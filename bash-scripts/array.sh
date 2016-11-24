#!/bin/bash

# Author : Chirag Jain
# Copyright (c) Amaeka

# Array variable can hold multiple vaules
# Groups a set of variables

echo "Array variable can hold multiple vaules"

echo "Assigning value to array, Syntex::"
echo "array_name[index]=value"

# Example
NAME[0]="Karan"
NAME[1]="Sahil"
NAME[2]="Arun"

# Initialization depenps upon the type of shell as well
# Ksh => set -A array_name value1 value2 ... value
# bash => array_name=(value1 ... valuen)

echo "Accessing array variables"

# Syntex: ${array_name[index]}
echo "First Index: ${NAME[0]}"

echo "Access all in one go:"

echo "First Method: ${NAME[*]}"
# or via: Output names with spaces
echo "Second Method: ${NAME[@]}"
