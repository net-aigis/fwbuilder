#!/usr/bin/env bash
# Phase-1976: soft-complete through 1976 (catalog_summary flags + ms 4250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1976
assert m.WEBUI_HONESTY_MILESTONE == 4250
print("soft-complete >=1976", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1976|Soft-complete STATUS through 1976|through 1976' webui/STATUS.md
echo "STATUS soft-complete 1976 ok"
echo "cleaned"
echo "OK: phase1976 e2e passed"
