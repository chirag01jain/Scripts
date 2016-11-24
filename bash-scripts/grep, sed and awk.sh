#!/bin/bash

# Author : Chirag Jain
# Copyright (c) Amaeka
# Script to install Python version 3.4 using source
# For Redhat, Cent0S and Fedora distros
# grep, sed, and awk
www-users.york.ac.uk/~mijp1/teaching/2nd_year_Comp_Lab/guides/grep_awk_sed.pdf

--------grep-------

# grep - global regular expression print, only search string in each file line. Working, pick 1st line in buffer, match, print on screen & repeat till last line

gerp "Hello" myFile
grep -n "Hello" myFile # Print line no. as well
grep -nv "Hello" myFile # Print unmatch lines with line no."
grep -c "Hello" myFile #Supress priting of lines & show no. of recurrenece times
grep -l "Hello" myFile1 myFile2 #Print only filename that it has
# -i (ignore case), -x (exact matches), -A3 (additional lines after match)
# grep - Allow us to use regex--wildcards in searching Ex:
grep "e$" myFile #print lines ending in 'e'
# more wider searching use , egrep ~ grep -E
grep -E "Hello|Hi" myFile # | - or
# Search special char $ which is regex, then use \ or -F (fixed string search)

# ===== http://gnosis.cx/publish/programming/regular_expressions.html

--------AWK-------
# A text scanning & processing lang, by 3 devs, A,W,K.
# Operates on any file (std-in |), & see each line made up of fields seperated by FS. Command has BEGIN {before processing file} MAIN {work on each line} END {after EOF}, pattern matching instructions -> maths + string manupulation. First field - $1, $2 and whole $0, FS set by FS=":", provide support for if, loops (for & while)
# Internal variable -> FS, NR (line no.), NF (No. of fields in line)
# line oriented lang, pattern 1st then action, Rand() , sqrt(), int(), tolower(), split(), length(), match()

# $5 - 5th field
ls -l | awk 'BEGIN {sum=0} {sum=sum+$5} END {print sum}'
cat /etc/sysconfig/network | awk -F"=" '{print NR,$2}'

#  trim a file and only operate on every 3rd line for instance
ls -l | awk '{for (i=1;i<3;i++) {getline}; print NR,$0}'
/*
say 10 lines
for (i=1;i<3,i++) {
  getline # Set $0 from next input record
};
print NR, $0 # after reading this line, i re-initializes to 1.
*/

# Pass variables into an awk program using '-v' flag as many times
awk -v skip=3 '{for (i=1;i<skip;i++) {getline}; print $0}' a_file

------------sed :: stream editor------------

# sed performs basic text transformations on an input stream , filter text
# used to edit a file, search and replace, lime operated, so globally use g

# change 1st occur of input - output in myFile and output new file content after change to stdout, expr b/w /../ can be a string or regexp

# 'e' IMP No change in real file, only the o/p shows change content + all
sed -e 's/input/output/' myFile

# Change in real file
sed -i 's/input/output/' myFile # does not o/p but change

# Use of wildcards, escape \ and & etc..
# '&'  corresponds to pattern found. U want to take every line starting with number in your file and surround that number by parentheses
sed -i 's/[0-9]*/(&)/g' myFile

-------------
General Form::
-------------
sed -e '/pattern/ command' my_file
# pattern - any regexp , and command is 's' = search & replace, 'p' = print, or 'd' = delete, or 'i'=insert, or 'a'=append, etc

# To suppress display of non-change values, use -n flag + p (to control printing)
sed -en 's/input/output/p' myFile

----
Regexp ::
-----

^e --> Line starting with e
e$ --> Line ending with e

Ques :  Print all directories
ls -l | sed -ne '/^d/ p'

Ques: Delete line starting from #

sed -e '/^#/ d' my_file
# execute command on 1 to 100 lines
sed -e '1,100 command' my_file

# Delete 11th to lines till end offile.
sed -e '11,$ d' my_file

grep -q '^option' file && sed -i 's/^option.*/option=value/' file || echo 'option=value' >> file

Tutorial :: ttp://www.grymoire.com/Unix/Sed.html
