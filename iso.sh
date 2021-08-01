#!/bin/sh
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/corgios.kernel isodir/boot/corgios.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "corgios" {
	multiboot /boot/corgios.kernel
}
EOF
grub-mkrescue -o corgios.iso isodir
