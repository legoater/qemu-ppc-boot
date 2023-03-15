#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS=''
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_bamboo/output/host/bin:${PATH}"
exec qemu-system-ppc -nographic -M bamboo -kernel vmlinux -net nic,model=virtio-net-pci -net user  ${EXTRA_ARGS}
)
