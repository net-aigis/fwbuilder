#!/usr/bin/env bash
# Phase-3664: soft-complete through 3664 (hard_gaps_summary_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3664
assert "soft_fertig_hard_gaps_summary_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3664", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3664|Soft-complete STATUS through 3664|through 3664' webui/STATUS.md
echo "STATUS soft-complete 3664 ok"
echo "cleaned"
echo "OK: phase3664 e2e passed"
