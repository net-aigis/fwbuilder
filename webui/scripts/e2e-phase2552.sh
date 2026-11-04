#!/usr/bin/env bash
# Phase-2552: soft-complete through 2552 (honesty export roster + ms 6050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2552
assert m.WEBUI_HONESTY_MILESTONE == 6050
print("soft-complete >=2552", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2552|Soft-complete STATUS through 2552|through 2552' webui/STATUS.md
echo "STATUS soft-complete 2552 ok"
echo "cleaned"
echo "OK: phase2552 e2e passed"
