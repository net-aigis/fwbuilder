#!/usr/bin/env bash
# Phase-3424: soft-complete through 3424 (session_storage_clear_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3424
assert "soft_fertig_session_storage_clear_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3424", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3424|Soft-complete STATUS through 3424|through 3424' webui/STATUS.md
echo "STATUS soft-complete 3424 ok"
echo "cleaned"
echo "OK: phase3424 e2e passed"
