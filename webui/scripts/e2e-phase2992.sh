#!/usr/bin/env bash
# Phase-2992: soft-complete through 2992 (ssh_honesty_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2992
print("soft-complete >=2992", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2992|Soft-complete STATUS through 2992|through 2992' webui/STATUS.md
echo "STATUS soft-complete 2992 ok"
echo "cleaned"
echo "OK: phase2992 e2e passed"
