#!/usr/bin/env bash
set -e

# Based on https://astr0baby.wordpress.com/2019/01/19/customizing-the-clover-iso-mojave-loader/

CLOVER="Clover-v2.4k-4533-X64"
VOLNAME="CLOVER"

hdiutil detach -quiet "/Volumes/${CLOVER}" 2>/dev/null || true
hdiutil attach "${CLOVER}.iso"

hdiutil detach -quiet "/Volumes/${VOLNAME}" 2>/dev/null || true
hdiutil create -megabytes 16 -fs MS-DOS -volname "${VOLNAME}" -attach -o ./clover.dmg

cp -r "/Volumes/${CLOVER}/"* "/Volumes/${VOLNAME}/"
cp ./config.plist "/Volumes/${VOLNAME}/EFI/CLOVER/"
cp /usr/standalone/i386/apfs.efi  "/Volumes/${VOLNAME}/EFI/CLOVER/drivers64UEFI/"

hdiutil detach -quiet "/Volumes/${CLOVER}" 2>/dev/null || true
hdiutil detach -quiet "/Volumes/${VOLNAME}" 2>/dev/null || true

hdiutil makehybrid -iso -joliet -o ./clover.iso ./clover.dmg

exit 0
