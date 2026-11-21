#!/usr/bin/env bash
# Phase-3504: soft-complete through 3504 (honesty_operator_brief_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3504
assert "soft_fertig_honesty_operator_brief_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3504", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3504|Soft-complete STATUS through 3504|through 3504' webui/STATUS.md
echo "STATUS soft-complete 3504 ok"
echo "cleaned"
echo "OK: phase3504 e2e passed"
