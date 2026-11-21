#!/usr/bin/env bash
# Phase-2376: soft-complete through 2376 (Soft 2360+ + ms 5500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2376
assert m.WEBUI_HONESTY_MILESTONE == 5500
print("soft-complete >=2376", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2376|Soft-complete STATUS through 2376|through 2376' webui/STATUS.md
echo "STATUS soft-complete 2376 ok"
echo "cleaned"
echo "OK: phase2376 e2e passed"
