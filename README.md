# oxideOS

A rusty OS kernel.


## Initial Setup

### 1. Install Rust with the Nightly toolchain
If using rustup (recommended):

```bash
rustup install nightly
```
The `rust-toolchain` file should select this by default once installed.

### 2. Install cargo-bootimage
This is a cargo subcommand tool, not a Rust crate dependency, so has to be installed manually:

```bash
cargo install bootimage
```

### 3. Install QEMU (x86_64 system emulator)

On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install qemu-system-x86
```

On Fedora:

```bash
sudo dnf install qemu-system-x86
```

On Arch Linux:

```bash
sudo pacman -S qemu
```

**Note**: QEMU is used here, but other emulators will work but have to be configured manually.


## Building and Running

### Option 1. Build and Run

Use the configured cargo runner with:
```bash
cargo run
```

### Option 2. Manual build and run

#### Build the bootable OS image

```bash
cargo bootimage
```

#### Run the OS in QEMU


Run QEMU manually (or via `run.sh`):

```bash
GTK_PATH=/usr/lib/x86_64-linux-gnu/gtk-3.0 \
GTK_MODULES="" \
qemu-system-x86_64 -drive format=raw,file=target/x86_64_os/debug/bootimage-oxide_os.bin
```

**Note:** To avoid GTK-related errors with QEMU when running through `bootimage runner`, make sure your environment variables are set correctly (see below).


## VS Code Configuration

To avoid GTK symbol lookup errors when running QEMU inside VS Code, set these environment variables in your workspace settings.

Create or update `.vscode/settings.json` with:

```json
{
  "terminal.integrated.env.linux": {
    "GTK_PATH": "/usr/lib/x86_64-linux-gnu/gtk-3.0",
    "GTK_MODULES": ""
  }
}
```

This ensures the integrated terminal in VS Code has the correct GTK environment for QEMU.
