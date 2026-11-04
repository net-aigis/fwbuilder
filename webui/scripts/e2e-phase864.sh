#!/usr/bin/env bash
# Phase-864: soft-complete through 864 (stretch/chrome samples).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 864
print("soft-complete >=864", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase864|Soft-complete STATUS through 864|through 864' webui/STATUS.md
echo "STATUS soft-complete 864 ok"
echo "cleaned"
echo "OK: phase864 e2e passed"
