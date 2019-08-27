#!/usr/bin/env bash
set -e

CLOVER="Clover-v2.4k-4533-X64"

hdiutil detach -quiet "/Volumes/${CLOVER}" 2>/dev/null || true
hdiutil attach "${CLOVER}.iso"
