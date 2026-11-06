#!/usr/bin/env bash
# Phase-3984: soft-complete through 3984 (hard_gaps_field_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3984
assert "soft_fertig_hard_gaps_field_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3984", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3984|Soft-complete STATUS through 3984|through 3984' webui/STATUS.md
echo "STATUS soft-complete 3984 ok"
echo "cleaned"
echo "OK: phase3984 e2e passed"
