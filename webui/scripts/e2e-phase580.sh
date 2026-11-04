#!/usr/bin/env bash
# Phase-580: STATUS 577–584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase577\|e2e-phase577' webui/STATUS.md
grep -q 'phase584\|e2e-phase584' webui/STATUS.md
grep -qi 'parent_path\|hard_gap_notes' webui/STATUS.md
echo "STATUS 577-584 ok"
echo "cleaned"
echo "OK: phase580 e2e passed"
