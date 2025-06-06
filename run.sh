#!/bin/bash
qemu-system-x86_64 -drive format=raw,file=target/x86_64_os/debug/bootimage-rust_os.bin
