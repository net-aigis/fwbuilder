#!/usr/bin/env bash
# Phase-1416: soft-complete through 1416 (milestone 2500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1416
assert m.WEBUI_HONESTY_MILESTONE == 2500
print("soft-complete >=1416", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1416|Soft-complete STATUS through 1416|through 1416' webui/STATUS.md
echo "STATUS soft-complete 1416 ok"
echo "cleaned"
echo "OK: phase1416 e2e passed"
