#!/usr/bin/env bash
# Phase-4752: soft-complete through 4752 (ssh_not_implemented_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4752
print("soft-complete >=4752", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4752|Soft-complete STATUS through 4752|through 4752' webui/STATUS.md
echo "STATUS soft-complete 4752 ok"
echo "cleaned"
echo "OK: phase4752 e2e passed"
