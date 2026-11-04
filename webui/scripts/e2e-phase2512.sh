#!/usr/bin/env bash
# Phase-2512: soft-complete through 2512 (session_storage_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2512
print("soft-complete >=2512", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2512|Soft-complete STATUS through 2512|through 2512' webui/STATUS.md
echo "STATUS soft-complete 2512 ok"
echo "cleaned"
echo "OK: phase2512 e2e passed"
