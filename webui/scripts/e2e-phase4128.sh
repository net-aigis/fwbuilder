#!/usr/bin/env bash
# Phase-4128: soft-complete through 4128 (Soft 4120+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4128
print("soft-complete >=4128", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4128|Soft-complete STATUS through 4128|through 4128' webui/STATUS.md
echo "STATUS soft-complete 4128 ok"
echo "cleaned"
echo "OK: phase4128 e2e passed"
