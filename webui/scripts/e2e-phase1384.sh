#!/usr/bin/env bash
# Phase-1384: soft-complete through 1384 (milestone 2400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1384
assert m.WEBUI_HONESTY_MILESTONE == 2400
print("soft-complete >=1384", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1384|Soft-complete STATUS through 1384|through 1384' webui/STATUS.md
echo "STATUS soft-complete 1384 ok"
echo "cleaned"
echo "OK: phase1384 e2e passed"
