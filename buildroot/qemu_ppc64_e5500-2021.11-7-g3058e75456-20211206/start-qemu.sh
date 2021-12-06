#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS=''
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc64_e5500/output/host/bin:${PATH}"
exec qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel uImage -drive file=rootfs.ext2,if=virtio,format=raw -net nic,model=virtio-net-pci -net user -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic  ${EXTRA_ARGS}
)
