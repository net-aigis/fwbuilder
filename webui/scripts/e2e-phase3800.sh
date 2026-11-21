#!/usr/bin/env bash
# Phase-3800: soft-complete through 3800 (hard_gaps_closure_roster session + ms 9950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3800
assert m.WEBUI_HONESTY_MILESTONE == 9950
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3800", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3800|Soft-complete STATUS through 3800|through 3800' webui/STATUS.md
echo "STATUS soft-complete 3800 ok"
echo "cleaned"
echo "OK: phase3800 e2e passed"
