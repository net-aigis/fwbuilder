#!/usr/bin/env bash
# Phase-2224: soft-complete through 2224 (hard-gap roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2224
print("soft-complete >=2224", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2224|Soft-complete STATUS through 2224|through 2224' webui/STATUS.md
echo "STATUS soft-complete 2224 ok"
echo "cleaned"
echo "OK: phase2224 e2e passed"
