# RaspPI_SIM7600X
Esthablishing fully operational installation of Rapsberian image and SIM7600 HAT as a router device


Configuration before the installation 

sudo raspi-config
  ==== Choose Interfacing Options -> Serial -> no , to disable Linux’s use of console UART
    1. Over Serial = NO
    2. Serial Port = Yes
 
Open /boot/config.txt file, find the below statement and uncomment it to enable the UART. 
You can directly append it at the end of file as well. enable_uart=1

Reboot

run the installation script 
raspberryinstallation.sh


AT Command interface 
minicom -D /dev/ttyS0
