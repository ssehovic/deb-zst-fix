#!/bin/bash

echo "Repackage DEB package to fix zst compress error and install on bullseye!"

deb_file=$1

if [ ! -d tmp/ ]; then
  mkdir tmp/
fi

cp $deb_file tmp/

cd tmp/

ar x $deb_file
zstd -d < control.tar.zst | xz > control.tar.xz
zstd -d < data.tar.zst | xz > data.tar.xz
ar -m -c -a sdsd $deb_file.repack.deb debian-binary control.tar.xz data.tar.xz
rm debian-binary control.tar.xz data.tar.xz control.tar.zst data.tar.zst $deb_file

echo "New repacked deb file" $deb_file.repack.deb "created!"
