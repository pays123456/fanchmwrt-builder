#!/usr/bin/env bash
set -euo pipefail

SRC="$1"
TARGET="$2"
SUBTARGET="$3"
OUT="${4:-artifacts}"

ARTIFACTS_DIR="$SRC/bin/targets/$TARGET/$SUBTARGET"
if [[ ! -d "$ARTIFACTS_DIR" ]]; then
  echo "::error::No artifacts directory found: $ARTIFACTS_DIR"
  exit 1
fi
mkdir -p "$OUT"
cp "$ARTIFACTS_DIR"/*-sysupgrade.* "$OUT/" 2>/dev/null || true
cp "$ARTIFACTS_DIR"/*-factory.* "$OUT/" 2>/dev/null || true
cp "$ARTIFACTS_DIR"/*.bin "$OUT/" 2>/dev/null || true
cp "$ARTIFACTS_DIR"/*.itb "$OUT/" 2>/dev/null || true
ls -lh "$OUT"
