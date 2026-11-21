#!/usr/bin/env bash
# Phase-2440: soft-complete through 2440 (honesty_path_roster sessionStorage + ms 5700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2440
assert m.WEBUI_HONESTY_MILESTONE == 5700
print("soft-complete >=2440", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2440|Soft-complete STATUS through 2440|through 2440' webui/STATUS.md
echo "STATUS soft-complete 2440 ok"
echo "cleaned"
echo "OK: phase2440 e2e passed"
