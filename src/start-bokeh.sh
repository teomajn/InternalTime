#!/bin/bash

. activate ~/anaconda/envs/py2.7

echo
echo "--------------------------------------------------"
echo "|"

if [ $# -eq 1 ]
then
    DBFILENAME=$1
    echo "| starting redis with saved db" $1
else
    DBFILENAME=`date -u "+%Y%m%d_%H%M%S"`.db
    echo "| starting redis with new db" $DBFILENAME
fi
echo "|"
echo "--------------------------------------------------"
echo

redis-server --dir . --dbfilename $DBFILENAME --port 7001 &
sleep 1
bokeh-server --backend redis --no-start-redis &> /dev/null &
sleep 1
redis-cli -p 7001
