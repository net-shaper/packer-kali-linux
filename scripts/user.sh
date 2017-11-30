#!/bin/bash

# Root User Config
ROOT_PW='RootChangeMe!'
Root_SSH=''

# Otto User Config
OTTO_PW='OttoChangeMe!'
OTTO_SSH=''

# Root Actual Configuration
mkdir -p /root/.ssh/
echo $ROOT_SSH >> /root/.ssh/authorized_keys
echo root:$ROOT_PW | /usr/sbin/chpasswd

# Actual Otto Configuration
mkdir -p /home/otto/.ssh
echo $OTTO_SSH >> /home/otto/.ssh/authorized_keys
chown otto:otto /home/otto/.ssh/authorized_keys
chown otto:otto /home/otto/.ssh
echo otto:$OTTO_PW | /usr/sbin/chpasswd

# OpenSSH Config
mkdir /etc/ssh/old_keys
mv /etc/ssh/ssh_host_* /etc/ssh/old_keys
dpkg-reconfigure openssh-server
sed -i 's/*PermitRootLogin*/PermitRootLogin\ without-password/g' /etc/ssh/sshd_config
