#!/bin/bash

# Copyright UiPath 2021
#
# =================
# LICENSE AGREEMENT
# -----------------
#   Use of paid UiPath products and services is subject to the licensing agreement
#   executed between you and UiPath. Unless otherwise indicated by UiPath, use of free
#   UiPath products is subject to the associated licensing agreement available here:
#   https://www.uipath.com/legal/trust-and-security/legal-terms (or successor website).
#   You must not use this file separately from the product it is a part of or is associated with.
lsblk -o NAME,HCTL,SIZE,MOUNTPOINT | grep -i "sd"

###############################
#Output example 
###############################
            
#            sda               2:0:0:0      64G 
#            ├─sda1                        500M /boot/efi
#            ├─sda2                        500M /boot
#            ├─sda3                          2M 
#            └─sda4                         63G 
#            sdb               3:0:1:0     400G 
#            └─sdb1                        400G /mnt
#            sdc               5:0:0:0       2T 
#            sdd               5:0:0:1      16G 
#            sde               5:0:0:2      256G
#            
###############################
# Next commands ( "setup mount ")
# ( get the drive_setup bash script ), (change the bash right to execute), (run the install)
###############################
wget -O ~/configureUiPathDisks.sh https://download.uipath.com/automation-suite/configureUiPathDisks.sh 
cd /root
chmod +x configureUiPathDisks.sh
./configureUiPathDisks.sh --node-type server --install-type online --cluster-disk-name /dev/sde  --etcd-disk-name /dev/sdd --data-disk-name /dev/sdc 
###############################
# Next commands ( "ready for the install ")
# ( install unzip   ),( get the install bash script ) (change the bash right to execute), (run the install)
###############################
# yum install unzip jq -y
###############################
# Not in the Uipath doc .. 
# In the Azure Redhat image we are missing  "jd" and you need to add this manually
# ( get RPM   ),( yum update "why not" ) ( yum install of jq)
###############################
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum update -y
sudo yum install  jq -y
###############################
###############################2022.4.1
wget -O ~/installUiPathAS.sh https://download.uipath.com/automation-suite/2022.4.1/installUiPathAS.sh
chmod +x ~/installUiPathAS.sh
echo "ready for manuall install"
