# gcc g++ install 

    sudo apt install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

    sudo apt install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf

    arm-linux-gnueabi-g++ hello.c -o hello

    arm-linux-gnueabihf-g++ hello.c -o hello32

    ./qemu-arm -L /usr/arm-linux-gnueabihf ./hello32

    ./qemu-arm -L /usr/arm-linux-gnueabi ./hello

### reference 

- [用Qemu模擬ARM](https://jasonblog.github.io/note/qemu/yong_qemu_mo_ni_arm.html)

- [如何用Qemu来模拟ARM系统](https://www.cnblogs.com/sewain/p/14206365.html)