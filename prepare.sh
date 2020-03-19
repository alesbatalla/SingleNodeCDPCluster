#! /bin/bash
echo "-- needed to deploy on azure default vms"
echo  "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.conf
echo  "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.conf
echo  "net.bridge.bridge-nf-call-arptables = 1" >> /etc/sysctl.conf
sysctl net.bridge.bridge-nf-call-ip6tables=1
sysctl net.bridge.bridge-nf-call-iptables=1
sysctl net.bridge.bridge-nf-call-arptables=1
yum install -y git nfs-utils nmap-ncat libtool-ltdl libcgroup policycoreutils-python ntp socat conntrack-tools

echo "-- modify partitions from D16_v3 to install cloudera"
lsblk
umount /mnt/resource -l
mkdir -p /opt/cloudera
mount /dev/sdb1 /opt/cloudera -l