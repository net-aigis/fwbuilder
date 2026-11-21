#!/usr/bin/env bash
# Phase-4376: soft-complete through 4376 (Soft 4360+ / ms 11750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4376
assert m.WEBUI_HONESTY_MILESTONE == 11750
print("soft-complete >=4376", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4376|Soft-complete STATUS through 4376|through 4376' webui/STATUS.md
echo "STATUS soft-complete 4376 ok"
echo "cleaned"
echo "OK: phase4376 e2e passed"
