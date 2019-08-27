A makefile to automate the creation of ISO image of macOS described in
[VirtualBox: How to create a macOS High Sierra VM to run on a Mac host system](https://tobiwashere.de/2017/10/virtualbox-how-to-create-a-macos-high-sierra-vm-to-run-on-a-mac-host-system/).

```
make build
make clover
```

and we should get `macos.iso` and `./clover/clover.iso`.

```
make clean
```
to remove all generated files.

Follow [this guide](https://astr0baby.wordpress.com/2018/08/03/installing-mojave-10-14-beta-in-virtualbox-5-2-16-on-linux-x86_64/) for installation and use `vbox.sh`.
