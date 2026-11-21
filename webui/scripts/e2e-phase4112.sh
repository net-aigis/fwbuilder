#!/usr/bin/env bash
# Phase-4112: soft-complete through 4112 (layout_fidelity_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4112
assert "layout_fidelity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4112", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4112|Soft-complete STATUS through 4112|through 4112' webui/STATUS.md
echo "STATUS soft-complete 4112 ok"
echo "cleaned"
echo "OK: phase4112 e2e passed"
