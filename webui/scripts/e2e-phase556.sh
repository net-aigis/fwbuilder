#!/usr/bin/env bash
# Phase-556: STATUS 553–560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase553\|e2e-phase553' webui/STATUS.md
grep -q 'phase560\|e2e-phase560' webui/STATUS.md
grep -qi 'closure_path\|hard_gap_count\|steps/refusals' webui/STATUS.md
echo "STATUS 553-560 ok"
echo "cleaned"
echo "OK: phase556 e2e passed"
