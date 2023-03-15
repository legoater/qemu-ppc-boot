#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS=''
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_mac99/output/host/bin:${PATH}"
exec qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel vmlinux -drive file=rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda"  ${EXTRA_ARGS}
)
