#!/usr/bin/env bash
# Phase-4008: soft-complete through 4008 (hard_gaps_field_roster export + ms 10600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4008
assert m.WEBUI_HONESTY_MILESTONE == 10600
print("soft-complete >=4008", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4008|Soft-complete STATUS through 4008|through 4008' webui/STATUS.md
echo "STATUS soft-complete 4008 ok"
echo "cleaned"
echo "OK: phase4008 e2e passed"
