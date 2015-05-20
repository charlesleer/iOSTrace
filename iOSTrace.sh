#!bin/bash
#
#charles.leerink@outlook.com
#
#
#v3 fix for using USB hub vs Direct connection
#
#
#find the UDID from systemprofiler assumming just 1 device is connected

#if [ $# -eq 0 ]
#  then
#    echo "Please start as sh iOSTrace.sh <number>"
#    echo "Where number is: 34 when using a USB hub that goes to the Mac or 29 when cable is directly connected to the Mac"
#    echo "eg: sh iOSTrace.sh 34"
#    exit 1
#fi

UDID=`system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p' | grep "Serial Number: " | sed 's/.*Number://'`
clear
echo "Easy iOS Trace v3"
echo ""
echo ""
echo ""
echo "Using: $UDID for Remote Virtual Interface" 
rvictl -s $UDID
echo ""
echo "Start WireShark and start a capture on the rviX device:"
echo `ifconfig |grep rvi`
echo ""
echo ""
read -p "Press [ENTER] to disconnect the RVI"
rvictl -x $UDID
exit
