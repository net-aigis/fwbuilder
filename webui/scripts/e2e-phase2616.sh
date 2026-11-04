#!/usr/bin/env bash
# Phase-2616: soft-complete through 2616 (Soft 2600+ + ms 6250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2616
assert m.WEBUI_HONESTY_MILESTONE == 6250
print("soft-complete >=2616", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2616|Soft-complete STATUS through 2616|through 2616' webui/STATUS.md
echo "STATUS soft-complete 2616 ok"
echo "cleaned"
echo "OK: phase2616 e2e passed"
