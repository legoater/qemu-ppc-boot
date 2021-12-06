#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS=''
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_sam460ex/output/host/bin:${PATH}"
exec qemu-system-ppc -nographic -M sam460ex -kernel vmlinux -device virtio-net-pci,netdev=net0 -netdev user,id=net0  ${EXTRA_ARGS}
)
