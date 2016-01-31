#!/bin/bash - 
#===============================================================================
#
#          FILE: check_port_status.sh
# 
#         USAGE: ./check_port_status.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: jiangxin, 
#  ORGANIZATION: 
#       CREATED: 2016年01月30日 21:22
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error

beginPort=$1
endPort=$2

for((i=${beginPort}; i<=${endPort}; i++));
do
    netstat -anp | grep $i;
done
