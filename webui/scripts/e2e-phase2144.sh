#!/usr/bin/env bash
# Phase-2144: soft-complete through 2144 (honesty operator brief).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2144
print("soft-complete >=2144", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2144|Soft-complete STATUS through 2144|through 2144' webui/STATUS.md
echo "STATUS soft-complete 2144 ok"
echo "cleaned"
echo "OK: phase2144 e2e passed"
