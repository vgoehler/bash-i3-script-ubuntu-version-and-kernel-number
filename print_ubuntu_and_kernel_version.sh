#!/bin/bash
# this script is ment for i3 wm blocks
# it outputs the version name of ubuntu and the kernel version in i3-blocks style (see man i3blocks)

USAGE="Usage: $0 or $0 file1 file2; version one queries website, version two is for testing and uses dumps, first is output of lsb_release -dc, second is output of uname -r"

# accept zero or two parameters
if  [ $# -ne 0 ] && [ $# -ne 2 ]
then
    echo "$USAGE"
    exit -1
fi

if [ $# -gt 0 ]
then
    # in test mode, we got two parameters
    # process first parameter
    if [ -f $1 ]
    then
        LSB_RELEASE=$(<$1) # put content into variable
    else
        echo "FILE $1 NOT FOUND" && exit 25
    fi
    # process second parameter
    if [ -f $2 ]
    then
        UNAME=$(<$2) # put content into variable
    else
        echo "FILE $2 NOT FOUND" && exit 25
    fi
else
    LSB_RELEASE=$(lsb_release -dc)
    UNAME=$(uname -r)
fi

# set colors;
COLOR_FG="#426BDC"
COLOR_BG="#DC6642"

LSB_RELEASE=($(echo "$LSB_RELEASE" | sed 's/ Code/\nCode/' | awk -F" " '{print $2, $3}'))
# LSB_RELEASE is an array; 0 is Ubuntu; 1 is version number; 2 is version string

UNAME=($(echo "$UNAME" | sed 's/-/\n/g'))
# UNAME is an array; 0 is version number; 1 is build number; 2 is "generic"

# Print Out
# first line long text
echo "${LSB_RELEASE[1]}(${LSB_RELEASE[2]})[${UNAME[0]}-${UNAME[1]}]"
# second line short text
echo "${LSB_RELEASE[2]}[${UNAME[0]}]"
# foreground color
echo $COLOR_FG
# background color
echo $COLOR_BG
