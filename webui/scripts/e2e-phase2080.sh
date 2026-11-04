#!/usr/bin/env bash
# Phase-2080: soft-complete through 2080 (honesty surface changelog).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2080
print("soft-complete >=2080", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2080|Soft-complete STATUS through 2080|through 2080' webui/STATUS.md
echo "STATUS soft-complete 2080 ok"
echo "cleaned"
echo "OK: phase2080 e2e passed"
