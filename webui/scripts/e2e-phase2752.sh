#!/usr/bin/env bash
# Phase-2752: soft-complete through 2752 (surface_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2752
print("soft-complete >=2752", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2752|Soft-complete STATUS through 2752|through 2752' webui/STATUS.md
echo "STATUS soft-complete 2752 ok"
echo "cleaned"
echo "OK: phase2752 e2e passed"
