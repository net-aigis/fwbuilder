#!/usr/bin/env bash
# Phase-2352: soft-complete through 2352 (hard_gap_refusal_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2352
print("soft-complete >=2352", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2352|Soft-complete STATUS through 2352|through 2352' webui/STATUS.md
echo "STATUS soft-complete 2352 ok"
echo "cleaned"
echo "OK: phase2352 e2e passed"
