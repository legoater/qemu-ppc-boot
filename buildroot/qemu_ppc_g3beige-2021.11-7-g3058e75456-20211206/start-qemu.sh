#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS='-serial stdio'
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_g3beige/output/host/bin:${PATH}"
exec qemu-system-ppc -M g3beige -kernel vmlinux -drive file=rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/sda"  -net nic,model=rtl8139 -net user  ${EXTRA_ARGS}
)
