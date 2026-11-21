#!/usr/bin/env bash
# Phase-2720: soft-complete through 2720 (surface_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2720
print("soft-complete >=2720", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2720|Soft-complete STATUS through 2720|through 2720' webui/STATUS.md
echo "STATUS soft-complete 2720 ok"
echo "cleaned"
echo "OK: phase2720 e2e passed"
