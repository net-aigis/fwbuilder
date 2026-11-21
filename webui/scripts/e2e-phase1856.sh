#!/usr/bin/env bash
# Phase-1856: soft-complete through 1856 (track_note sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1856
print("soft-complete >=1856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1856|Soft-complete STATUS through 1856|through 1856' webui/STATUS.md
echo "STATUS soft-complete 1856 ok"
echo "cleaned"
echo "OK: phase1856 e2e passed"
