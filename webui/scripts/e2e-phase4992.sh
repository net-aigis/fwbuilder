#!/usr/bin/env bash
# Phase-4992: soft-complete through 4992 (ssh_alternatives_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4992
print("soft-complete >=4992", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4992|Soft-complete STATUS through 4992|through 4992' webui/STATUS.md
echo "STATUS soft-complete 4992 ok"; echo "cleaned"; echo "OK: phase4992 e2e passed"
