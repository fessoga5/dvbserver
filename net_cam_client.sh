#!/bin/sh

DAEMON_NAME="net_cam_client"
if [ "$1" ] ; then 
   DAEMON_NAME="$DAEMON_NAME-$1"
fi

PT=`dirname $0`
SE=`basename $0`
cd $PT

killall $DAEMON_NAME 2>&1 1>/dev/null
sleep 10
while true
do
	ps aux|grep $DAEMON_NAME|grep -v grep|grep -v $SE 2>&1 1>/dev/null
        RES=$?
        if [ $RES != 0 ]
        then
    		echo " restart $PT/$DAEMON_NAME "
		$PT/$DAEMON_NAME $2 
        fi
        sleep 30
done
