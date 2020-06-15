# bash-i3-script-ubuntu-version-and-kernel-number
A short script to display ubuntu version and kernel version in i3 blocks

## Requirements

- uname
- lsb_release
- sed
- awk

## Usage
Just launch the script `print_ubuntu_and_kernel_version.sh`.
For testing purposes it accepts two parameters. First expects the output of `lsb_release -dc`. Second of `uname -r`
