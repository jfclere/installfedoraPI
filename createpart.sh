# create the partitions.
fdisk /dev/mmcblk0 -l
# first umount the file systems
fdisk /dev/mmcblk0 -l | grep ^/dev | awk ' { print umount $1 } ' > $$.sh
bash $$.sh
rm $$.sh
# do a backup of the existing partitions.
sfdisk --dump /dev/mmcblk0 > $$.partitions
