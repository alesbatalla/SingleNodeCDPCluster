#! /bin/bash
echo "-- needed to deploy on azure default vms"
sudo su -
lsblk
fdisk /dev/sdd <<EOF
n
p
1

p
w
EOF
mkfs -t ext4 /dev/sdd1
mount /dev/sdd1 /opt
blkid 
echo '/opt   ext4   defaults,nofail   1   2' >>/etc/fstab
mount -a