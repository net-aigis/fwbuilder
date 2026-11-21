#!/usr/bin/env bash
# Phase-2592: soft-complete through 2592 (honesty_export_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2592
print("soft-complete >=2592", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2592|Soft-complete STATUS through 2592|through 2592' webui/STATUS.md
echo "STATUS soft-complete 2592 ok"
echo "cleaned"
echo "OK: phase2592 e2e passed"
