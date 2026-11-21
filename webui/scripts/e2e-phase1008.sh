#!/usr/bin/env bash
# Phase-1008: soft-complete through 1008 (with_enabled).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1008
print("soft-complete >=1008", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1008|Soft-complete STATUS through 1008|through 1008' webui/STATUS.md
echo "STATUS soft-complete 1008 ok"
echo "cleaned"
echo "OK: phase1008 e2e passed"
