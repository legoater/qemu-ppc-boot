#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS='-serial stdio'
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc64le_pseries/output/host/bin:${PATH}"
exec qemu-system-ppc64 -M pseries,x-vof=on -cpu POWER8 -m 256 -kernel vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=rootfs.ext2,if=scsi,index=0,format=raw  -display curses  ${EXTRA_ARGS}
)
