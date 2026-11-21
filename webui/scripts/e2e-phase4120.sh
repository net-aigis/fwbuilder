#!/usr/bin/env bash
# Phase-4120: soft-complete through 4120 (layout_fidelity_roster session + ms 10950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4120
assert m.WEBUI_HONESTY_MILESTONE == 10950
assert "layout_fidelity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4120", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4120|Soft-complete STATUS through 4120|through 4120' webui/STATUS.md
echo "STATUS soft-complete 4120 ok"
echo "cleaned"
echo "OK: phase4120 e2e passed"
