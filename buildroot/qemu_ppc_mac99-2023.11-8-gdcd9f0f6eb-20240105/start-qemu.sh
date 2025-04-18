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
    export PATH="/home/legoater/work/buildroot/buildroot-qemu_ppc_mac99/output/host/bin:${PATH}"
fi

exec qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel vmlinux -drive file=rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda"  ${EXTRA_ARGS} "$@"
