#!/bin/bash

# Author : Chirag Jain
# Copyright (c) Amaeka
# Script follows here

pwd
ls
echo "What's your name?"
read myName
echo "Hello, $myName"

# Variables :
# A variable is a character string to which we assign a value, pointer to the actual data.
# Unix Shell variables would have their names in UPPERCASE.

# Assigning value to Scalar variable (Hold only one value at a time)
PROFILE=Linux

# Accessing value : Prefix name with $ `sign`
echo $PROFILE

# Read Only Variables : mark variables as read only
MOBILE="ASUS"
readonly MOBILE

# The below statement will throw an error
# /bin/sh: NAME: This variable is read only
MOBILE="iPhone"

# Unsetting Variables : `Cannot be used for readonly variable`
unset variable_name

## Types of variable :: Local,Environmental, Shell variable.

# 1. Local: Can be used within instance of shell, not available to programs started by shell.
# 2. Environmental: Available for any child process of the shell
# 3. Shell: Special, set by shell and is required by it to function correctly.
