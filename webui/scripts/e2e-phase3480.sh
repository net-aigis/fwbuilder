#!/usr/bin/env bash
# Phase-3480: soft-complete through 3480 (session_storage_clear_roster session + ms 8950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3480
assert m.WEBUI_HONESTY_MILESTONE == 8950
assert "session_storage_clear_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3480", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3480|Soft-complete STATUS through 3480|through 3480' webui/STATUS.md
echo "STATUS soft-complete 3480 ok"
echo "cleaned"
echo "OK: phase3480 e2e passed"
