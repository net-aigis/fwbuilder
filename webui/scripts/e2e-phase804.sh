#!/usr/bin/env bash
# Phase-804: STATUS mentions tree depth / buddy samples / 801-808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'layout_tree_max_depth|treeDepth=|buddy_labels samples' webui/STATUS.md
grep -qE 'phase808|through 808|e2e-phase808' webui/STATUS.md
echo "STATUS tree/buddy ok"
echo "cleaned"
echo "OK: phase804 e2e passed"
