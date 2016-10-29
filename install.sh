if [ -f ./Fedora-Server-armhfp-24-1.2-sda.raw ]; then
  echo "Reusing ./Fedora-Server-armhfp-24-1.2-sda.raw"
else
  wget https://dl.fedoraproject.org/pub/fedora/linux/releases/24/Server/armhfp/images/Fedora-Server-armhfp-24-1.2-sda.raw.xz
  unxz Fedora-Server-armhfp-24-1.2-sda.raw.xz
fi
losetup --partscan --find --show ./Fedora-Server-armhfp-24-1.2-sda.raw /dev/loop0
rm -rf /tmp/img/
mkdir /tmp/img/
mount -r /dev/loop0p3 /tmp/img/

# use fdisk to create the partitions...
fdisk /dev/mmcblk0 -l
bash createpart.sh

# create the file systems and copy basic fedora
bash installbase.sh

# prepare PI fstab
blkid | grep mmcblk0
cp fstab.base /tmp/rpi/etc/fstab

# firmware/boot configuration
#> /tmp/rpi/boot/config.txt
cp cmdline.txt /tmp/rpi/boot/cmdline.txt

# install firmware and modules.
if [ -d ./firmware-master ]; then
  echo "firmware-master already here!!!"
else
   wget https://github.com/raspberrypi/firmware/archive/master.zip
   unzip master.zip
fi
cp -r ./firmware-master/boot/* /tmp/rpi/boot/
cp -r ./firmware-master/modules/* /tmp/rpi/lib/modules/

# configure root to access via ssh.
#  copy ssh key to root in PI.
mkdir /tmp/rpi/root/.ssh
#cp $HOME/.ssh/
cp /home/jfclere/.ssh/id_rsa.pub /tmp/rpi/root/.ssh/authorized_keys
chmod 600 /tmp/rpi/root/.ssh/authorized_keys
chmod 700 /tmp/rpi/root/.ssh

# for the rest boot the PI with a ethernet cable
