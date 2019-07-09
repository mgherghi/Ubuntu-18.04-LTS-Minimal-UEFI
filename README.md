# Ubuntu 18.04 LTS Minimal UEFI NetInstaller

A guide to building an ISO image for the Ubuntu 18.04 LTS Minimal installer, that doesn't support UEFI out of the box.

## Documentation

You can find detailed information about the process of building the ISO [here](DOC.md).

## Prebuilt ISO

If you would like to save youself the hassble of building your own ISO, you can use [this one](Ubuntu18.04LTSMinimalUEFINetInstallerUnscripted.iso). This ISO does not contain the `ks.cfg` for [automated installing](https://help.ubuntu.com/lts/installation-guide/i386/ch04s06.html). If you want to use this feature, you will need to go through the process yourself.

## Sources

There are articles that need to be credited, because without them, this guide would not have been possible.

1. [How do I create an EFI-bootable ISO of a customized version of Ubuntu?](https://askubuntu.com/questions/457528/how-do-i-create-an-efi-bootable-iso-of-a-customized-version-of-ubuntu)
2. [Ubuntu 18.04 UEFI network installer](https://noobient.com/2019/06/25/ubuntu-18-04-uefi-network-installer/)
3. [Ubuntu Kickstart template](https://github.com/vrillusions/ubuntu-kickstart/blob/master/18.04/ks-1804-minimalvm.cfg)
4. [Ubuntu automated installation](https://help.ubuntu.com/lts/installation-guide/i386/ch04s06.html)
