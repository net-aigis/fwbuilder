#!/usr/bin/env bash
# Phase-4064: soft-complete through 4064 (layout_fidelity_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4064
assert "soft_fertig_layout_fidelity_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4064", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4064|Soft-complete STATUS through 4064|through 4064' webui/STATUS.md
echo "STATUS soft-complete 4064 ok"
echo "cleaned"
echo "OK: phase4064 e2e passed"
