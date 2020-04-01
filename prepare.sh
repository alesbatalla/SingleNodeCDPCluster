#! /bin/bash
echo "-- needed to deploy on azure default vms"
sudo lsblk
sudo fdisk /dev/sdd <<EOF
n
p
1


p
w
EOF
sudo mkfs -t ext4 /dev/sdd1
sudo mount /dev/sdd1 /opt
sudo blkid
sudo echo '/dev/sdd1   /opt   ext4   defaults,nofail   1   2' >>/etc/fstab
sudo mount -a