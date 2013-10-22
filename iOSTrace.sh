#!bin/bash
#
#charles.leerink@outlook.com
#
#
#find the UDID from systemprofiler assumming just 1 device is connected
UDID=`system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p' | grep "Serial Number:" | awk -F ": " '{print $2}'`
clear
echo "Easy iOS Trace"
echo ""
echo "Using $UDID for Remote Virtual Interface" 
rvictl -s $UDID
echo ""
echo "Start WireShark and start a capture on the rviX device:"
echo `ifconfig |grep rvi`
echo ""
echo ""
read -p "Press [ENTER] to disconnect the RVI"
rvictl -x $UDID
exit

