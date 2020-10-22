#!/bin/sh
# Base is image Rapsberian for Rapsberry 

apt-get update
apt-get upgrade -y
apt-get install p7zip -y
apt-get install libqmi-utils -y
apt-get install udhcpc -y
apt-get install minicom -y
apt-get install mc -y

echo ***************************************************************************************************
echo                                     CURL  - DOWNLOAD SIM7600X files 
echo *************************************************************************************************** 

curl http://www.ingcool.com/w/images/2/29/SIM7600X-4G-HAT-Demo.7z --output /home/pi/Downloads/SIM7600X.7z

echo ***************************************************************************************************
echo                                     7ZIP and Move 
echo *************************************************************************************************** 

p7zip -d /home/pi/Downloads/SIM7600X.7z
mkdir /home/SIM7600X4G
mv /root/SIM7600X-4G-HAT-Demo/* /home/SIM7600X4G
rm -d /root/SIM7600X-4G-HAT-Demo/
chmod 777 /home/SIM7600X4G/Raspberry/c/sim7600_4G_hat_init

echo ***************************************************************************************************
echo  Go to raspi-config >
echo  ==== Choose Interfacing Options -> Serial -> no , to disable Linux’s use of console UART
echo    1. Over Serial = NO
echo    2. Serial Port = Yes
echo *************************************************************************************************** 
