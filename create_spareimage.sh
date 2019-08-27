#!/usr/bin/env bash
set -e
set -x

MOUNT_AT="/Volumes/install_build"
IMAGE_NAME="macos.sparseimage"

INSTALLER="Install macOS Mojave"
if [ -n "${1}" ]; then
    INSTALLER="${1}"
fi

hdiutil detach -quiet "/Volumes/${INSTALLER}" 2>/dev/null || true
hdiutil create -o "${IMAGE_NAME}" -size 8G -layout SPUD -fs HFS+J -type SPARSE
hdiutil attach "${IMAGE_NAME}" -noverify -mountpoint "${MOUNT_AT}"
sudo "/Applications/${INSTALLER}.app/Contents/Resources/createinstallmedia" --volume "${MOUNT_AT}"
hdiutil detach -quiet "/Volumes/${INSTALLER}"

exit 0
