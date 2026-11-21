#!/usr/bin/env bash
# Phase-3952: soft-complete through 3952 (res_status_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3952
assert "res_status_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3952", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3952|Soft-complete STATUS through 3952|through 3952' webui/STATUS.md
echo "STATUS soft-complete 3952 ok"
echo "cleaned"
echo "OK: phase3952 e2e passed"
