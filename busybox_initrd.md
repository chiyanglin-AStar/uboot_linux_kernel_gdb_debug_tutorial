#  Busybox build initrd steps 

cd busybox-1.xx.5

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- defconfig

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- menuconfig ( change to static)

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- install


make ARCH=arm  CROSS_COMPILE=arm-linux-gnueabi- install

mkdir rootfs

cd rootfs

mkdir -pv {bin,sbin,etc,proc,sys,usr/{bin,sbin}}

cp -r ../_install/* .

建立一個initial script(很重要!!)
    vim init

-----------------
#!/bin/sh

mount -t proc none /proc
mount -t sysfs none /sys

echo -e "\nBoot took $(cut -d' ' -f1 /proc/uptime) seconds\n"

exec /bin/sh
-----------------
chmod +x init

find . -print0 | cpio --null -ov --format=newc | gzip -9 > ./initramfs-busybox-arm.cpio.gz

cd ../..

qemu-system-arm -M romulus-bmc -m 512 -kernel ./linux-5.16.9_arm/arch/arm/boot/zImage  -initrd ./busybox/rootfs/initramfs-busybox-arm.cpio.gz  -dtb ./linux-5.16.9_arm/arch/arm/boot/dts/aspeed-ast2500-evb.dtb -nodefaults -nographic  -serial stdio -net nic -net user,hostname=qemu

