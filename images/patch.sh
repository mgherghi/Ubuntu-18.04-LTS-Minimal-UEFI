#!/bin/bash

set -eu

server_iso='ubuntu-18.04.2-server-amd64.iso'
mini_iso='mini.iso'
dist_dir='ubuntu-18.04-netinstall'

if [ ! -e ${server_iso} ]
then
    wget "http://cdimage.ubuntu.com/releases/18.04/release/${server_iso}"
fi

if [ ! -e ${mini_iso} ]
then
    wget "http://archive.ubuntu.com/ubuntu/dists/bionic-updates/main/installer-amd64/current/images/netboot/${mini_iso}"
fi

rm -rf ${dist_dir}*
7z x ${server_iso} -o${dist_dir}-tmp install/hwe-netboot/ubuntu-installer/amd64/linux
7z x ${server_iso} -o${dist_dir}-tmp install/hwe-netboot/ubuntu-installer/amd64/initrd.gz
7z x ${server_iso} -o${dist_dir} EFI
7z x ${mini_iso} -o${dist_dir}
mv ${dist_dir}-tmp/install/hwe-netboot/ubuntu-installer/amd64/linux ${dist_dir}/linux
mv ${dist_dir}-tmp/install/hwe-netboot/ubuntu-installer/amd64/initrd.gz ${dist_dir}/initrd.gz
rm -rf ${dist_dir}-tmp
