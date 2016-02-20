#! /bin/sh
clear
name="$(pwd)"
size=${#name}
name=${name:9:size}
if [ ! $name == "keyInstaller" ];
	then
	echo "Renaming USB Key..."
	/usr/sbin/diskutil rename $name keyInstaller
	cd ..
	cd keyInstaller
	echo "Done!"
	else
	echo "USB Name is correct                    ✓"
fi
if [ ! -f id_rsa.pub ];
	then
	cp ~/.ssh/id_rsa.pub . && echo "Public Key Copied!"
	else
	echo "id_rsa.pub exists                      ✓"
fi
if [ ! -f whoamis.txt ];
	then
	touch whoamis.txt && echo "whoamis.txt created!"
	else
	echo "whoamis.txt exists                     ✓"
fi
if [ ! -f hostnames.txt ];
	then
	touch hostnames.txt && echo "hostnames.txt created!"
	else
	echo "hostnames.txt exists                   ✓"
fi
chmod +x script.sh && echo "script.sh is now executable            ✓"

echo "     _                  " 
echo "  __| | ___  _ __   ___ " 
echo " / _  |/ _ \|  _ \ / _ \ "
echo "| (_| | (_) | | | |  __/ "
echo " \__,_|\___/|_| |_|\___| "