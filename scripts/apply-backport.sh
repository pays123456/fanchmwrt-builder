#!/usr/bin/env bash
set -euo pipefail

SRC="$1"
TARGET="$2"
SUBTARGET="$3"
PROFILE="$4"
BACKPORT_ROOT="${5:-}"

if grep -q "$PROFILE" "$SRC/target/linux/$TARGET/image/$SUBTARGET.mk" 2>/dev/null; then
  echo "Device $PROFILE already supported, no backport needed"
  exit 0
fi

if [[ -z "$BACKPORT_ROOT" || ! -d "$BACKPORT_ROOT" ]]; then
  echo "::error::Device $PROFILE is not supported by source tree and no backport repo was provided"
  exit 1
fi

DEV_DIR="$BACKPORT_ROOT/devices/$TARGET/$SUBTARGET/$PROFILE"
if [[ ! -d "$DEV_DIR" ]]; then
  echo "::error::Backport directory not found: $DEV_DIR"
  exit 1
fi

bash "$BACKPORT_ROOT/apply.sh" "$SRC" "$TARGET" "$SUBTARGET" "$PROFILE" "$DEV_DIR"
