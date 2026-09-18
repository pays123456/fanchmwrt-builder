#!/usr/bin/env bash
set -euo pipefail

SRC="$1"
cd "$SRC"
./scripts/feeds update -a
./scripts/feeds install -a
