Simple script to repack debian package

Error is: error: archive [somepackage.deb] uses unknown compression for member [control.tar.zst], giving up

To fix this we have to repackage deb package with expected xz compression.
 