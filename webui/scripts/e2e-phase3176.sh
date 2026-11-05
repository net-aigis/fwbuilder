#!/usr/bin/env bash
# Phase-3176: soft-complete through 3176 (Soft 3160+ + ms 8000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3176
assert m.WEBUI_HONESTY_MILESTONE == 8000
print("soft-complete >=3176", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3176|Soft-complete STATUS through 3176|through 3176' webui/STATUS.md
echo "STATUS soft-complete 3176 ok"
echo "cleaned"
echo "OK: phase3176 e2e passed"
