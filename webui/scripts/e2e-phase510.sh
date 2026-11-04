#!/usr/bin/env bash
# Phase-510: STATUS 505–512 mentions.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase505\|e2e-phase505' webui/STATUS.md
grep -q 'phase512\|e2e-phase512' webui/STATUS.md
grep -qi 'field-ui-hidden\|layout_tree_max_depth' webui/STATUS.md
echo "STATUS 505-512 ok"
echo "cleaned"
echo "OK: phase510 e2e passed"
