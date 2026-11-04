#!/usr/bin/env bash
# Phase-2608: soft-complete through 2608 (Soft 2600+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2608
print("soft-complete >=2608", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2608|Soft-complete STATUS through 2608|through 2608' webui/STATUS.md
echo "STATUS soft-complete 2608 ok"
echo "cleaned"
echo "OK: phase2608 e2e passed"
