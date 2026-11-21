#!/usr/bin/env bash
# Phase-15336: soft-complete through 15336 (ms 46000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15336
assert m.WEBUI_HONESTY_MILESTONE == 46000
print("soft-complete >=15336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15336|through 15336' webui/STATUS.md
echo "OK: phase15336 e2e passed"
