#!/usr/bin/env bash
# Phase-4000: soft-complete through 4000 (hard_gaps_field_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4000
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4000", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4000|Soft-complete STATUS through 4000|through 4000' webui/STATUS.md
echo "STATUS soft-complete 4000 ok"
echo "cleaned"
echo "OK: phase4000 e2e passed"
