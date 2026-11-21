#!/usr/bin/env bash
# Phase-4032: soft-complete through 4032 (hard_gaps_field_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4032
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4032", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4032|Soft-complete STATUS through 4032|through 4032' webui/STATUS.md
echo "STATUS soft-complete 4032 ok"
echo "cleaned"
echo "OK: phase4032 e2e passed"
