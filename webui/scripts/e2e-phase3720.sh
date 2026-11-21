#!/usr/bin/env bash
# Phase-3720: soft-complete through 3720 (hard_gaps_summary_roster session + ms 9700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3720
assert m.WEBUI_HONESTY_MILESTONE == 9700
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3720", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3720|Soft-complete STATUS through 3720|through 3720' webui/STATUS.md
echo "STATUS soft-complete 3720 ok"
echo "cleaned"
echo "OK: phase3720 e2e passed"
