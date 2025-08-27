#!/usr/bin/env bash
set -e

export PATH="/c/Tools/xpack-aarch64-none-elf-gcc-14.2.1-1.1/bin:$PATH"

make TOOLCHAIN_PREFIX=aarch64-none-elf- qemu-virt-arm64-test
qemu-system-aarch64 \
  -cpu cortex-a53 \
  -machine virt \
  -m 512 -smp 1 \
  -nographic -net none \
  -kernel build-qemu-virt-arm64-test/lk.elf

