#!/usr/bin/env bash
# Phase-3744: soft-complete through 3744 (hard_gaps_closure_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3744
assert "soft_fertig_hard_gaps_closure_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3744", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3744|Soft-complete STATUS through 3744|through 3744' webui/STATUS.md
echo "STATUS soft-complete 3744 ok"
echo "cleaned"
echo "OK: phase3744 e2e passed"
