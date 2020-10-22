#!/bin/sh
# Base is image Rapsberian for Rapsberry and executed rapsberryinstallation.sh script 
# sh /home/SIM7600X4G/Raspberry/c/sim7600_4G_hat_init must be in /etc/rc.local

echo ***********************************************************************************
echo Initialization of the module SIM7600
echo *********************************************************************************** 
echo
qmicli -d /dev/cdc-wdm0 --dms-set-operating-mode='online'
#double check of the operation mode 
qmicli -d /dev/cdc-wdm0 --dms-get-operating-mode 
sleep 3

echo ***********************************************************************************
echo Confirmation that modem is in the system and device name is WWAN0
echo *********************************************************************************** 
echo 
qmicli -d /dev/cdc-wdm0 -w
sleep 3

echo ***********************************************************************************
echo Setup RAW IP 
echo *********************************************************************************** 
echo
ip link set wwan0 down
echo 'Y' | tee /sys/class/net/wwan0/qmi/raw_ip
ip link set wwan0 up
sleep 3

echo ***********************************************************************************
echo Open network connection with Vodafone CZ 
echo *********************************************************************************** 
echo
qmicli -p -d /dev/cdc-wdm0 --device-open-net='net-raw-ip|net-no-qos-header' --wds-start-network="apn='internet',ip-type=4,auth=PAP" --client-no-release-cid
sleep 3

echo ***********************************************************************************
echo Obtain IP address from provider Vodafone CZ
echo *********************************************************************************** 
echo
udhcpc -i wwan0

echo ***********************************************************************************
echo Module/device information commands 
echo *********************************************************************************** 
echo

qmicli -d /dev/cdc-wdm0 --nas-get-home-network
qmicli -d /dev/cdc-wdm0 --dms-get-operating-mode 
qmicli -d /dev/cdc-wdm0 --nas-get-signal-strength 
qmicli -d /dev/cdc-wdm0 --nas-get-signal-info
qmicli -d /dev/cdc-wdm0 --nas-get-lte-cphy-ca-info
qmicli -d /dev/cdc-wdm0 --wds-get-current-settings
qmicli -d /dev/cdc-wdm0 --nas-get-system-selection-preference
#qmicli -d /dev/cdc-wdm0 --nas-set-system-selection-preference=lte
qmicli -d /dev/cdc-wdm0 --nas-get-rf-band-info
