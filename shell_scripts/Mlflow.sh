#!/bin/bash

PROC_NAME='mlflow'
ps -ef | grep $PROC_NAME | grep -v grep

if [ $? -eq 0 ];then
	echo "Found!  killing..."
	ps aux|grep -w $PROC_NAME|grep -v grep|awk '{print $2}'|xargs kill

fi

. activate IL

# or nohup in the head.
mlflow ui --port 10500 1>mlflow.log 2>&1 &
echo "Done!"
#cat token.log | grep --color=always -P "token=([0-9]|[a-zA-Z])*" -o | head -n 1