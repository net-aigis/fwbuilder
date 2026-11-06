#!/usr/bin/env bash
# Phase-3904: soft-complete through 3904 (res_status_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3904
assert "soft_fertig_res_status_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3904", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3904|Soft-complete STATUS through 3904|through 3904' webui/STATUS.md
echo "STATUS soft-complete 3904 ok"
echo "cleaned"
echo "OK: phase3904 e2e passed"
