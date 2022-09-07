# u-boot build and debug flow 

ref : https://shenki.github.io/debugging-u-boot-after-relocation/

sudo apt install gdb-multiarch qemu-system-arm gcc-arm-linux-gnueabi flex

git clone git://git.denx.de/u-boot.git

cd u-boot

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-

make clean       (if have used make command)

make mrproper    (if have used make command)

make evb-ast2500_defconfig

CROSS_COMPILE="ccache arm-linux-gnueabi-"  make -j $(nproc)

or 

make -j $(nproc)

##  make u-boot image for gemu

 dd if=/dev/zero of=test.img count=32 bs=1M

 dd if=u-boot.bin of=test.img conv=notrunc

qemu-system-arm -M ast2500-evb -nographic -drive file=test.img,format=raw,if=mtd,readonly -s -S 

qemu-system-arm -M tacoma-bmc -nographic -drive file=test.img,format=raw,if=mtd