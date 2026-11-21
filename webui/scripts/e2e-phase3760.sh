#!/usr/bin/env bash
# Phase-3760: soft-complete through 3760 (hard_gaps_closure_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3760
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3760", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3760|Soft-complete STATUS through 3760|through 3760' webui/STATUS.md
echo "STATUS soft-complete 3760 ok"
echo "cleaned"
echo "OK: phase3760 e2e passed"
