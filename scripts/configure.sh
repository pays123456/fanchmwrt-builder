#!/usr/bin/env bash
set -euo pipefail

SRC="$1"
TARGET="$2"
SUBTARGET="$3"
PROFILE="$4"
CONFIG_FILE="${5:-configs/base.config}"

cd "$SRC"
rm -f .config
cat "$CONFIG_FILE" > .config
make defconfig

if ! grep -q "CONFIG_TARGET_.*DEVICE_${PROFILE}=y" .config; then
  echo "::error::Profile $PROFILE is not enabled after defconfig"
  exit 1
fi
