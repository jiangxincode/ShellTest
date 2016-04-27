#!/bin/bash - 
#===============================================================================
#
#          FILE: findinjar.sh
# 
#         USAGE: ./findinjar.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Aloys jiangxinnju@163.com
#  ORGANIZATION: 
#       CREATED: 2016年04月26日 21:58
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

find_in_jar_help()
{
    echo "Usage:"
    echo "    ./findinjar.sh keyword path";
    echo "    for example: ./findinjar.sh event /usr/local";
    echo "    contact jiangxin"
}

if [ $# != 2 ];then
    find_in_jar_help;
    exit; 
fi

keyword=$1;
local=$2;

for filename in `find $local -name '*.jar'`;
do
    result=`unzip -l "$filename" | grep "$keyword"`;
    if [ $? == 0 ];then
        echo "$filename :$result"
    fi
done

