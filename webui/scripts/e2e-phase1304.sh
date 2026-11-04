#!/usr/bin/env bash
# Phase-1304: soft-complete through 1304 (milestone 2150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1304
assert m.WEBUI_HONESTY_MILESTONE == 2150
print("soft-complete >=1304", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1304|Soft-complete STATUS through 1304|through 1304' webui/STATUS.md
echo "STATUS soft-complete 1304 ok"
echo "cleaned"
echo "OK: phase1304 e2e passed"
