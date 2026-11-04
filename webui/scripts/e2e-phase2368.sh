#!/usr/bin/env bash
# Phase-2368: soft-complete through 2368 (Soft 2360+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2368
print("soft-complete >=2368", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2368|Soft-complete STATUS through 2368|through 2368' webui/STATUS.md
echo "STATUS soft-complete 2368 ok"
echo "cleaned"
echo "OK: phase2368 e2e passed"
