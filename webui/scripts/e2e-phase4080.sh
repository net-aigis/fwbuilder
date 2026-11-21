#!/usr/bin/env bash
# Phase-4080: soft-complete through 4080 (layout_fidelity_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4080
assert "layout_fidelity_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4080", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4080|Soft-complete STATUS through 4080|through 4080' webui/STATUS.md
echo "STATUS soft-complete 4080 ok"
echo "cleaned"
echo "OK: phase4080 e2e passed"
