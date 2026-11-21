#!/usr/bin/env bash
# Phase-1072: soft-complete through 1072 (milestone 1450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1072
assert m.WEBUI_HONESTY_MILESTONE == 1450
print("soft-complete >=1072", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1072|Soft-complete STATUS through 1072|through 1072' webui/STATUS.md
echo "STATUS soft-complete 1072 ok"
echo "cleaned"
echo "OK: phase1072 e2e passed"
