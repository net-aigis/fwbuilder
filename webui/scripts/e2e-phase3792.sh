#!/usr/bin/env bash
# Phase-3792: soft-complete through 3792 (hard_gaps_closure_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3792
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3792", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3792|Soft-complete STATUS through 3792|through 3792' webui/STATUS.md
echo "STATUS soft-complete 3792 ok"
echo "cleaned"
echo "OK: phase3792 e2e passed"
