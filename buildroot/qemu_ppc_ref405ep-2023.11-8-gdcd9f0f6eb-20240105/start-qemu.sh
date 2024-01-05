#!/bin/sh

BINARIES_DIR="${0%/*}/"
# shellcheck disable=SC2164
cd "${BINARIES_DIR}"

mode_serial=false
mode_sys_qemu=false
while [ "$1" ]; do
    case "$1" in
    --serial-only|serial-only) mode_serial=true; shift;;
    --use-system-qemu) mode_sys_qemu=true; shift;;
    --) shift; break;;
    *) echo "unknown option: $1" >&2; exit 1;;
    esac
done

if ${mode_serial}; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS=''
fi

if ! ${mode_sys_qemu}; then
    export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_ref405ep/output/host/bin:${PATH}"
fi

exec qemu-system-ppc -nographic -M ref405ep -kernel ./cuImage.hotfoot.elf -initrd rootfs.cpio -serial null -net nic,addr=3 -net user -serial mon:stdio -nodefaults  ${EXTRA_ARGS} "$@"
