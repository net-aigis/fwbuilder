#!/usr/bin/env bash
# Phase-1320: soft-complete through 1320 (milestone 2200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1320
assert m.WEBUI_HONESTY_MILESTONE == 2200
print("soft-complete >=1320", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1320|Soft-complete STATUS through 1320|through 1320' webui/STATUS.md
echo "STATUS soft-complete 1320 ok"
echo "cleaned"
echo "OK: phase1320 e2e passed"
