#!/bin/bash
#------------------------------------------------------------------------------
# Configure Snapper
#------------------------------------------------------------------------------
#Umount the snapshots folder
umount /.snapshots
rm -r /.snapshots
#Create snapper configuration
snapper -c root create-config /
#Remove the newly created subvolume
btrfs subvolume delete /.snapshots
#Recreate folders
mkdir /.snapshots
#Remount the folders
mount -a 
#Adjust permissions
chmod 750 /.snapshots