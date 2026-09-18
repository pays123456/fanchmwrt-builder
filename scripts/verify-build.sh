#!/usr/bin/env bash
set -euo pipefail

SRC="$1"
TARGET="$2"
SUBTARGET="$3"
PROFILE="$4"

ARTIFACTS_DIR="$SRC/bin/targets/$TARGET/$SUBTARGET"
if [[ ! -d "$ARTIFACTS_DIR" ]]; then
  echo "::error::No artifacts directory found: $ARTIFACTS_DIR"
  exit 1
fi
ls -lh "$ARTIFACTS_DIR"
