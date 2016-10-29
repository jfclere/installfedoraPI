Scripts and tools to install fedora 24 on Rapsberry3
run on a laptop install.sh (or run the corresponding shells).
sync and mount the cdcard and put in the PI
plug it via ethernet cable and allow it to boot
find it via something like nmap -sn 192.168.1.0/24
double check it:
+++
[root@jfcpc NOTES]# nmap 192.168.1.108

Starting Nmap 7.12 ( https://nmap.org ) at 2016-10-29 13:53 CEST
Nmap scan report for 192.168.1.108
Host is up (0.0069s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
9090/tcp open  zeus-admin
MAC Address: B8:27:EB:7A:A6:98 (Raspberry Pi Foundation)

Nmap done: 1 IP address (1 host up) scanned in 0.65 seconds
+++

on the PI:
yum install git
clone the repo
git clone  https://github.com/jfclere/installfedoraPI
cd installfedoraPI
and run scrips to finish the install
