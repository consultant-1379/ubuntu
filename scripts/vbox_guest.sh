#!/bin/bash

# This installs Virtualbox guest additions.


echo "\n *** Installing Virtualbox Guest Additions ***\n" 
ls -lrt /tmp
ls -lrt /home/vagrant
ls -lrt /root
sudo mkdir /media/VBoxGuestAdditions
mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
