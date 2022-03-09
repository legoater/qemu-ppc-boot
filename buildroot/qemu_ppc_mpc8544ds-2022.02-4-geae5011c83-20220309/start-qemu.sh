#!/bin/sh
(
BINARIES_DIR="${0%/*}/"
cd ${BINARIES_DIR}

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS='-serial stdio'
fi

export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_mpc8544ds/output/host/bin:${PATH}"
exec qemu-system-ppc -M mpc8544ds -kernel vmlinux  -net nic,model=e1000 -net user  ${EXTRA_ARGS}
)
