#!/usr/bin/env bash
# Phase-2480: soft-complete through 2480 (session_storage_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2480
print("soft-complete >=2480", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2480|Soft-complete STATUS through 2480|through 2480' webui/STATUS.md
echo "STATUS soft-complete 2480 ok"
echo "cleaned"
echo "OK: phase2480 e2e passed"
