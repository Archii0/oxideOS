#!/bin/bash
export GTK_PATH=/usr/lib/x86_64-linux-gnu/gtk-3.0
export GTK_MODULES=""

qemu-system-x86_64 -drive format=raw,file=target/x86_64_os/debug/bootimage-oxideOS.bin
