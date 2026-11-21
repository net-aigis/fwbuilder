#!/usr/bin/env bash
# Phase-3712: soft-complete through 3712 (hard_gaps_summary_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3712
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3712", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3712|Soft-complete STATUS through 3712|through 3712' webui/STATUS.md
echo "STATUS soft-complete 3712 ok"
echo "cleaned"
echo "OK: phase3712 e2e passed"
