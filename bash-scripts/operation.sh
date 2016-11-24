#!/bin/bash

# Author : Chirag Jain
# Copyright (c) Amaeka
# Bourne Shell

# Basic Operators ::
# Arithmetic, Relational, Boolean, String, File Test Operators.

# Bourne Shell uses external programs like `awk` or `expr` to perform arithmetic operations.

echo "Add two numbers:"

val=`expr 2 + 2`
echo "Output is: $val"

# Note:
# 1. There must be space b/w operations and expressions -> wrong 2+2
# 2. Complete expression should be enclosed under `` : Inverted commas

echo "-----------"
echo "Arithmetic Operators"
echo "-----------"

a=10
b=20

echo "Say there are two variables, var1 and var2 with 10, 20 value assign resp."

echo "Addition:"
echo "`expr $a + $b`"

# Operators ::
# - (subtraction), * (Multiply), / (divide) , % (Modulus) , = (assignment) , == (Equality), != (Not Equal)

# a=$b (assignment)
# [ $a == $b ] would return false."
# [ $a != $b ] would return true.
# Incorrect ==> [$a!=$b]

echo "-----------"
echo "Relational Operators"
echo "-----------"
