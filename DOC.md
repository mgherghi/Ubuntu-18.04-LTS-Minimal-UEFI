# Setup of Ubuntu 18.04 LTS Minimal as UEFI NetInstaller

## Prerequisites

Starting things off, you will need access to both the [Ubuntu 18.04 LTS Minimal](http://archive.ubuntu.com/ubuntu/dists/bionic-updates/main/installer-amd64/current/images/netboot/mini.iso) and the [Ubuntu 18.04.2 LTS Server AMD64](http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.2-server-amd64.iso) images.

Furthermore, a linux environment as well as a windows environment make things easier. Starting in the linux environment, the farther we progress, we switch up to windows.

Although I need to mention that all this can also be accomplished with linux alone. The second part, using ImgBurn is then substituted with the [`mkisofs`](https://wiki.ubuntuusers.de/mkisofs/) command. But as this is more difficult, you will get the impression here. In case Windows is not an option, you will need to lookup the correct flags for [`mkisofs`](https://wiki.ubuntuusers.de/mkisofs/).

Nevertheless it is **highly recommended** to have experience with linux; especially with the command line - navigation, executing commands, etc.

## Step 0 - Cloning the GIT repository

You can clone this repository to whereever you want on your system. Just use
```
git clone -- https://github.com/Andevour/Ubuntu-18.04-LTS-Minimal-UEFI-NetInstaller.git .
```

## Step 1 - Setup of the images under Linux

There are two options. The first and easiest would be executing the [`patch.sh`](https://noobient.com/2019/06/25/ubuntu-18-04-uefi-network-installer/) script in the `images` directory. It will download the needed images, namely `mini.iso` and `ubuntu-18.04.2-server-amd64.iso`. It will patch the `mini.iso` in a way that certain files, obviously those needed for UEFI boot, are being copied together in a new folder that is named `ubuntu-18.04-netinstall`.

The script therefore relies on `wget` doing its job. If the URLs provided to wget fail, the script as whole will fail. In case that happens, you will need to download the images yourself, place them in the `images` directory and rename them, respectively to  `mini.iso` and `ubuntu-18.04.2-server-amd64.iso`.

The script also contains the copy command for the `ks.cfg`, a config file for [Ubuntu's automated install](https://help.ubuntu.com/lts/installation-guide/i386/ch04s06.html). If you are not familiar with this or just wish to not use it, delete the last line in the install script, which reads `cp ks.cfg ${dist_dir}/`. If you want to use automated install, you will likely need to customize the `ks.cfg` to your needs. The script will deploy it for you.

To make the script executable, open the terminal and navigate to the `images` directory. The command

``` bash
sudo chmod +x patch.sh
```

will do the rest. You can then execute it with

``` bash
./patch.sh
```

The script will give you a live indication of what's going on. After it finishes, the images folder will contain the folder `ubuntu-18.04-netinstall`.

## Step 2 - Creating the working ISO under Windows

The next step is to create the actual ISO image, that could be used with say VMware or burned to a pen drive. Here you will need to switch to Windows, for ease of use. The small programm [ImgBurn](http://www.imgburn.com/index.php?act=download) does the job. Copy the `images` directory over to Windows.

After installing it, open it up and choose the *build* mode ("create image file files/folders"). As for the source, you will need to select the `ubuntu-18.04-netinstall` folder. As for destination, choose your desired destination folder and add your desired name of your ISO at the end. The important part is hidden under the *Advanced / Bootable Disc* tab. Here you wil need to make changes according to this picture:

![test](ImgBurnOptions.jpg "ImgBurn Settings II")

The *Boot Image* can be found under `ubuntu-18.04-netinstall\boot\grub\efi.img`. Leave everything else as is.

You can then start the build process. You are prompted with the message saying you had only selected one folder. Just accept with yes, then again accept with yes, and last but not least, click ok.

That's it, you are done. The ISO you created should load up GRUB in EFI mode.
