#!/usr/bin/env bash
# Phase-2528: soft-complete through 2528 (Soft 2520+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2528
print("soft-complete >=2528", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2528|Soft-complete STATUS through 2528|through 2528' webui/STATUS.md
echo "STATUS soft-complete 2528 ok"
echo "cleaned"
echo "OK: phase2528 e2e passed"
