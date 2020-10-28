whereis httpd.conf
man whereis
clear
ls
cd /
ls
cd etc
lscd
clear
lsd 
cd apache2
ls
cd mods-enabled/
ls
cd ..
clear
ls
cd mods-available/
ls
cd ..
sl
clear
cd ..
clear
cd apach2
cd apache2
ls
cd conf-enabled/
ls
cd ..
clear
ls
apt-get install tree
dpkg -l | egrep php
apt-get install php7.3 libapache-mod-php7.3
apt-get install php7.3
service apache2 restart
clear
ls
cd mods-enabled
ls
cd ..
cd /var/www/
ls
cd html
ls
rm info.php
ls
mv index.php  ../php/
cd ..
cd php
ls
cd ..
ls
rm -rd html
ls
mv php html
ls
poweroff
ls
ls
cd .ssh
ls
rm -rd *
ls
cd ..
ls
cd computacionaplicada/
l
clear
ls
ssh-copy-id -i clave_publica_pablo.pub root@localhost
ssh-copy-id -i clave_publica_pablo.pub root@localhost -f
man ssh-copy-id | more
clear
ssh-copy-id -i clave_publica_pablo.pub root@localhost -f
man ssh-copy-id | more
clear
ssh-copy-id clave_publica_pablo.pub root@localhost 
ssh-copy-id clave_publica_pablo.pub 
ssh-copy-id root@localhost clave_publica_pablo.pub 
ssh-copy-id root@localhost
ls
chmod 700 clave_publica_pablo.pub 
ssh-copy-id -i clave_publica_pablo.pub root@localhost
ls /la
ls -la
clear
ssh-copy-id
ls
ssh-copy-id clave_publica_pablo.pub root@localhost
ssh-copy-id -i clave_publica_pablo.pub root@localhost
chmod 777 clave_publica_pablo.pub 
ssh-copy-id -i clave_publica_pablo.pub root@localhost
ssh-copy-id -i ./clave_publica_pablo.pub root@localhost
ssh-copy-id root@localhost
cp clave_publica_pablo.pub ../.ssh
ls
cd ..
ls
clear
cd .ssh
ls
ssh-copy-id root@localhost
ssh-copy-id root@localhost -i localhost
ssh-copy-id -i root@localhost localhost
clear
ssh-copy-id -i root@localhost localhost
ssh-copy-id -i root@/root/.ssh/clave_publica_pablo.pub localhost
ssh-copy-id -i root@clave_publica_pablo.pub localhost
ssh-copy-id -i clave_publica_pablo.pub localhost
clear
ssh-copy-id -i clave_publica_pablo.pub localhost
ssh-copy-id -i /root/.ssh/clave_publica_pablo.pub localhost
ls
mkdir authorized_keys
mv clave_publica_pablo.pub authorized_keys/
clear
ls
cd authorized_keys/
ssh-copy-id -i ./clave_publica_pablo.pub root@localhost
ssh-copy-id root@localhost
ssh-copy-id -i -f root@localhost
ssh-copy-id -i -f ./clave_publica_pablo.pub root@localhost
ssh-copy-id -i -f root@localhost ./clave_publica_pablo.pub
clear
ssh-copy-id -i ./ root@localhost
ssh-copy-id -i ./clave_publica_pablo.pub root@localhos
ls
mv clave_publica_pablo.pub id_rsa.pub
mv id_rsa.pub ../
cd ..
rm -rd authorized_keys/
clear
ls
ssh-copy-id root@localhost
ssh-copy-id -i ./id_rsa.pub root@localhost
ls
clear
htop
clear
cd /var
ls
yes
clear
cd /root
clear
ls
clea
clear
cowsay hola
lcsd - l
cd .ssh
ls
rm id_rsa.pub 
clear
ls
cd ..
clear
ls
git clone https://github.com/pabloniklas/computacionaplicada
ls
rm -rd computacionaplicada/
git clone https://github.com/pabloniklas/computacionaplicada
bash conectar_internet.sh 
git clone https://github.com/pabloniklas/computacionaplicada
clear
ls
cd computacionaplicada/
ls
ssh-copy-id -h

mv clave_publica_sonda.pub clave_sonda.pub
mv clave_privada_sonda clave_sonda
ssh-copy-id -i clave_sonda root@localhost
ifconfig
jobs
jobs
htop
kill 1112
htop
clear
history
poweroff
cowsay hola
ifconfig
yes > /dev/null &
ls
bash conectar_internet.sh 
clear
la -l
la -l
ls
ls -l
lsblk
man lsblk
clear
lsblk
apt-get update; apt-get install initramfs-tools mdadm
modprobe linear
modprobe multipath
modprobe raid0
modprobe raid5
modprobe raid5
modprobe raid6
modprobe raid10
cat /proc/mdstat
clear
lsblk
sfdisk -d /dev/sda | sfdisk --force /dev/sdb
clear;sfdisk -d /dev/sdc | sfdisk --force /dev/sdd
fdisk -L
fdisk -J
fdisk -l
clear
fdisk -l
clear
apt-get install lvm2
service lvm2 start
service
clear
systemctl list
systemctl 
clear
systemctl | egrep lvm
clear
screenfetch
clear
sysinfo
clear
screenfetch
clear
apt-get install system-config-lvm
clear
ls
lsblk
pvcreate /dev/sdc
lsblk
pvmove /dev/sdc
clear
mkfs
clear
man mkfs
clear
lsblk
fdisk
fdisk --help
lsblk
fdisk sdc
fdisk /sdc
fdisk /dev/sdc
lsblk
history
clear}
clear
lsblk
apt-get install initramfs-tools mdadm
clear
lsblk
sfdisk -d /dev/sdc | sfdisk --force /dev/sdd
clear
fdisk -l
lsblk
clear
fdisk /dev/sdd
lsblk
clear
cd /dev
ls
cd ..
ls
clear
mount /dev/sdc /montado
mkdir /montado
mount /dev/sdc /montado
ls -l
rmdir /montado/
cd home
cd .. 
cd root
ls
mkdir montado
ls -l
mount /dev/sdc /root/montado
mount /dev/sdc1 /root/montado
clear
mount /dev/sdc1 /root/montado
ls -l 
chmod o-w montado
ls -l 
chmod o-w montado
ls -l 
chmod 555 montado
ls -l 
mount /dev/sdc1 /root/montado
mount /dev/sdd1 /root/montado
mount /dev/sdd1dfgdf /root/montado
clea
clear
reboot
blkid
lsblk
blkid
blkid | egrep /de/sdd1
blkid | egrep /dev/sdd1
blkid | egrep /dev/sdd1 | tr "\s" " \n"
blkid | egrep /dev/sdd1 >> /etc/fstab
nano /etc/fstab
vim /etc/stab
vim /etc/fstab
vim /etc/fstab
reboot
blkid
ls
lsblk
mount /dev/sdb1 /montado
mount /dev/sdb1 montado
mount /dev/sdb1 /root/montado
mdadm --zero-superblock /dev/sdb1
mount /dev/sdb1 /root/montado
mount /dev/sdc1 /root/montado
clear
poweroff
lsblk
lsblk
cd /
ls
cd media
ls
cd ..
cd dev
ls
cd sdb1
cd sdb
mount sdb1 /prueba
mkdir /prueba
mount sdb1 /prueba
clear
fdisk /dev/sdc
clear
lsblk
fdisk sda2
clear
lsblk
mount sdb1 /prueba
man mkfs
mkfs -t
clear
fdisk -l
clear
mount sdb1 /prueba
fdisk -l
mount sdc1 /prueba
clear
cd ..
ls
mount sdc1 /prueba
cd dev
mount sdc1 /prueba
clear
cat /proc/mdstat 
lsblk
mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdb /dev/sdc
mdadm --query /dev/md1
mdadm --detail
mdadm --detail /dev/md1
lsblk
fdisk /dev/md1
lsblk
clear
cat /proc/mdstat 
fdisk -l
fdisk -l | less
fdisk -l | less
clear
lsblk
fdisk /dev/sdb1
fdisk /dev/sdb
lsblk
fdisk /dev/sdc
lsblk
fdisk -l
lsblk
fdisk /dev/md1/md1p1
fdisk /dev/md1
fdisk /dev/md1p1
history
history | less
clear
fdisk /dev/md1p1
reboot
clear
lsblk
fdisk /dev/md127
fdisk /dev/md127
clear
lsblk
pvcreate /dev/md127p1
pvdisplay
pvs
pvdisplay
lsblk
vgcreate vgraid /dev/md127p1
clear
vgs vgraid
lvcreate -n u01 -L 5G vgraid
lvcreate -n u02 -L 7G vgraid
lvcreate -n u03 -L 10G vgraid
lvcreate -n u03 -L 10240M vgraid
lvcreate -n u03  vgraid
lvcreate -n u03 vgraid
lvcreate -n u03 -L vgraid
lvcreate -n u03 -L 10239M vgraid
lvcreate -n u03 -L 10230M vgraid
lvcreate -n u03 -L 10220M vgraid
lvdisplay -C
lsblk
fdisk /dev/vgraid-u01
cd /dev
ls
ls -l
ls -l | less
ls -l | egrep ^d
clear
ls -l | egrep ^d
cd vgraid
ls
ls -l
cd ..
ls -l | 
ls -l | egrep dm
fdisk /dev/vgraid/u01
clear
mkfs -t ext4 /dev/vgraid/u01
mkfs -t xfs /dev/vgraid/u02
lslkb
lslk
lsblk
mkfs -t XFS /dev/vgraid/u02
mkfs -t VXFS /dev/vgraid/u02
mkfs -t brtfs /dev/vgraid/u02
mkfs -t Brtfs /dev/vgraid/u02

man mkfs
clear
mkfs -t ext2 /dev/vgraid/u02
mkfs -t ext3 /dev/vgraid/u03
lsblk
cd ..
mkdir {u01,u02,u03}
ls
mount /dev/vgraid/u01 /u01
lsblk
cd u01
touch hola
rm hola
cd ..
unmount /u01
unmount /dev/vgraid/u01
cd /etc
nano fstab
vim fstab
lsblk -l
clear
vgs
vgdisplay vgraid
lvs
lvdisplay /dev/vgraid/u01
lvdisplay /dev/vgraid/u01 | egrep LV UUID > uids
lvdisplay /dev/vgraid/u01 | egrep "LV UUID" > uids
vim uids
lvdisplay /dev/vgraid/u01 | egrep "LV UUID" >> /etc/fstab
rm uids
vim fstab
lvdisplay /dev/vgraid/u02 | egrep "LV UUID" >> /etc/fstab
vim fstab
lvdisplay /dev/vgraid/u03 | egrep "LV UUID" >> /etc/fstab
vim fstab
rebooy
reboot
lsblk
vim /etc/fstab
rebot
reboot
cat /etc/fstab
blkid
vim /etc/fstab
blkid
blkid | egrep "/dev/mapper" >> /etc/fstab
vim /etc/fstab
blkid | egrep "/dev/mapper" >> /etc/fstab
vim /etc/fstab
reboot
lsblk
ls /
poweroff
clear
lsblk
poweroff
sudo poweroff
