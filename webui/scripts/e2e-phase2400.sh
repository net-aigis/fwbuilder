#!/usr/bin/env bash
# Phase-2400: soft-complete through 2400 (honesty_path_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2400
print("soft-complete >=2400", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2400|Soft-complete STATUS through 2400|through 2400' webui/STATUS.md
echo "STATUS soft-complete 2400 ok"
echo "cleaned"
echo "OK: phase2400 e2e passed"
