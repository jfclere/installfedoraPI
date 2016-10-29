# create the file systems.
# and copy the fedora basic distribution
mkfs.vfat /dev/mmcblk0p1
mkswap /dev/mmcblk0p2
mkfs.ext4 /dev/mmcblk0p3
mkdir /tmp/rpi/
mount /dev/mmcblk0p3 /tmp/rpi/
mkdir /tmp/rpi/boot/
mount /dev/mmcblk0p1 /tmp/rpi/boot/
cp -rpv /tmp/img/* /tmp/rpi/
# sync (takes ages)
echo "WAIT!!!"
sync
losetup -d /dev/loop0
