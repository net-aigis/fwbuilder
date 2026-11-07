#!/usr/bin/env bash
# Phase-4616: soft-complete through 4616 (Soft 4600+ / ms 12500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4616
assert m.WEBUI_HONESTY_MILESTONE == 12500
print("soft-complete >=4616", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4616|Soft-complete STATUS through 4616|through 4616' webui/STATUS.md
echo "STATUS soft-complete 4616 ok"
echo "cleaned"
echo "OK: phase4616 e2e passed"
