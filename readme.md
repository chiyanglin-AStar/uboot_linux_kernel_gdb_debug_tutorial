#  This is CodingCoffee Kernel Build Tutorial
##   more courses : www.codingcoffee.org

#  Kernel Build Tutorial 
ref : https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html

ref : https://shenki.github.io/Booting-an-OpenBMC-kernel/

Linux kernel formal site :  https://www.kernel.org/ 

##  Get specific kernel version example 
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.16.9.tar.xz  


## uncompress kernel source code 
unxz -v linux-5.16.9.tar.xz

## use gpg verification kernel source code 
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.16.9.tar.sign

gpg --verify linux-5.16.9.tar.sign

example:  
gpg: assuming signed data in 'linux-5.16.9.tar'

gpg: Signature made Fri 11 Feb 2022 08:27:25 AM UTC

gpg:                using RSA key 647F28654894E3BD457199BE38DBBDC86092693E

gpg: Can't check signature: No public key

gpg --recv-keys xxxxxxxxxxx  (from gpg --verify linux-5.16.9.tar.sign)


gpg --verify linux-5.16.9.tar.sign

##  untar Linux Kernel Source files  

tar xvf linux-5.16.9.tar

cd linux-5.16.9

cp -v /boot/config-$(uname -r) .config   // this have issue 

## install related package and compiler kernel 

sudo apt-get install build-essential libncurses-dev bison flex libssl-dev libelf-dev

sudo apt-get install gcc-arm-linux-gnueabi u-boot-tools lzop 

apt-get update && apt-get install -yy bc build-essential git software-properties-common libssl-dev libelf-dev bison flex iputils-ping gcc-arm-linux-gnueabi u-boot-tools lzop 

apt-get update && apt-get install -yy bc build-essential git gcc-arm-linux-gnueabi binutils-arm-linux-gnueabi libssl-dev bison flex u-boot-tools

## arm architecture kernel build example 
export ARCH=arm

export CROSS_COMPILE=arm-linux-gnueabi-

make aspeed_g5_defconfig

make -j $(nproc)

## x86 architecture kernel build example 

qemu-system-x86_64 -hda disk.img -cdrom ../yocto101/core-image-minimal-genericx86-64.iso -boot d -nographic

qemu-system-x86_64 -hda disk.img -nographic