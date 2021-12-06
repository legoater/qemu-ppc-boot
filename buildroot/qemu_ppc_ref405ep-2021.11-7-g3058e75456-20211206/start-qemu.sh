#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS=''
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_ref405ep/output/host/bin:${PATH}"
exec qemu-system-ppc -nographic -M ref405ep -cpu 405ep -kernel ./cuImage.hotfoot -initrd rootfs.cpio.uboot -serial null -serial mon:stdio -nodefaults  ${EXTRA_ARGS}
)
