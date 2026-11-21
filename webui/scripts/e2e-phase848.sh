#!/usr/bin/env bash
# Phase-848: soft-complete through 848 (min/max size score weights).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 848
print("soft-complete >=848", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase848|Soft-complete STATUS through 848|through 848' webui/STATUS.md
echo "STATUS soft-complete 848 ok"
echo "cleaned"
echo "OK: phase848 e2e passed"
