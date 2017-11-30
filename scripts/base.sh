#!/bin/bash

# Update System
apt-get -y -qq update
DEBIAN_FRONTEND=noninteractive apt-get -y -qq dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get -y -qq install linux-headers-$(uname -r)

# VM Guest Support
DEBIAN_FRONTEND=noninteractive apt-get -y -qq install open-vm-tools open-vm-tools-desktop fuse iptables-persistent

# Cleanup
apt-get -y autoclean
apt-get -y clean

shutdown -r now
