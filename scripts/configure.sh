set -e
SRC="$1"
CFG="$5"

# 获取仓库根目录（脚本所在目录的上一级）
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Current dir: $(pwd)"
echo "Repo root: $REPO_ROOT"
echo "Looking for config: $REPO_ROOT/$CFG"

if [ ! -f "$REPO_ROOT/$CFG" ]; then
  echo "::error::base config not found: $CFG"
  exit 1
fi

cd "$SRC"
cp "$REPO_ROOT/$CFG" .config
make defconfig