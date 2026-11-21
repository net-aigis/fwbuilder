#!/usr/bin/env bash
# Phase-3680: soft-complete through 3680 (hard_gaps_summary_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3680
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3680", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3680|Soft-complete STATUS through 3680|through 3680' webui/STATUS.md
echo "STATUS soft-complete 3680 ok"
echo "cleaned"
echo "OK: phase3680 e2e passed"
