#!/bin/bash

# Author : Chirag Jain
# Copyright (c) Amaeka
# Special Variables: Reserved for specific functions

# 1. $ character represents `PID of the current shell`

# 1. The below command will output PID of the current shell
echo "The PID of current shell is:"
echo $$

# 2. $0 => `Filename of current Script`
echo "The filename of my current script is:"
echo $0

# 3. $n => corresponds to arguments with which script was invoked. The first argument: $1
echo "The first, second and third argument given to the script are"
echo $1 $2 $3

# 4. $# => total number of argument supplied to the string
echo "Total number of arguments suppied to the string are"
echo $#

# 5. $* => If all the arguments are double quotes, then say script receive 2 argument, then
# $* = $1 $2
echo $*

# 6. $@ => somewhat same as $*, arguments are individually double quoted.
echo $@

# 7. $? => The exit status of the last command executed.
echo "The status of last executed command is:"
echo $?

# 8. $! => The process number of the last background command.
echo "The PID of last background command is:"
echo $!

# Note: Special Parameters $* and $@ - allow accessing all the command line arguments
# Difference :
# 1. "$*" special parameter takes the entire list as one argument with spaces
# 2. "$@" special parameter takes the entire list and separates it into separate arguments.

# Example:

for TOKEN in $*
do
   echo $TOKEN
done

# Exit Status:
# Successfull => Exit Status `0`
# Unsuccessfull => Exit Status `1`
echo "Exit Status for successfull execution of command is 0"
echo "Exit Status for un-successfull execution of command is 1"

# Some can show other status as well fo different types of errors.
