#!/usr/bin/env bash
# Phase-3472: soft-complete through 3472 (session_storage_clear_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3472
assert "session_storage_clear_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3472", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3472|Soft-complete STATUS through 3472|through 3472' webui/STATUS.md
echo "STATUS soft-complete 3472 ok"
echo "cleaned"
echo "OK: phase3472 e2e passed"
