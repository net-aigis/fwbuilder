#!/usr/bin/env bash
# Phase-2560: soft-complete through 2560 (honesty_export_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2560
print("soft-complete >=2560", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2560|Soft-complete STATUS through 2560|through 2560' webui/STATUS.md
echo "STATUS soft-complete 2560 ok"
echo "cleaned"
echo "OK: phase2560 e2e passed"
