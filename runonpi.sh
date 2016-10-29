# prevent initial boot to run (again)
/bin/systemctl disable initial-setup.service
# remove modules and kernel to prevent updates.
dnf remove kernel kernel-core kernel-module
# adjust time zone/
rm /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime
# get firmware for wifi
(cd /lib/firmware/brcm/
 curl -O https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/master/brcm80211/brcm/brcmfmac43430-sdio.bin
 curl -O https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/master/brcm80211/brcm/brcmfmac43430-sdio.txt
)
# install network manager for the wifi.
dnf install NetworkManager-tui NetworkManager-wifi
