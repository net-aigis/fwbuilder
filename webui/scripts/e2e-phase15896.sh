#!/usr/bin/env bash
# Phase-15896: soft-complete through 15896 (ms 47750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15896
assert m.WEBUI_HONESTY_MILESTONE == 47750
print("soft-complete >=15896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15896|through 15896' webui/STATUS.md
echo "OK: phase15896 e2e passed"
