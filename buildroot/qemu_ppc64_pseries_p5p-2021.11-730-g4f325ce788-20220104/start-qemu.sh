#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS=''
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc64_pseries_p5p/output/host/bin:${PATH}"
exec qemu-system-ppc64 -M pseries -cpu POWER5+ -m 256 -kernel vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=rootfs.ext2,if=scsi,index=0,format=raw -device spapr-vlan,netdev=net0 -netdev user,id=net0 -serial mon:stdio -nodefaults -nographic  ${EXTRA_ARGS}
)
