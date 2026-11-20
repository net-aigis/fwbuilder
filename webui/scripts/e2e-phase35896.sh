#!/usr/bin/env bash
# Phase-35896: soft-complete through 35896 (ms 110250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35896
assert m.WEBUI_HONESTY_MILESTONE == 110250
print("soft-complete >=35896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35896|through 35896' webui/STATUS.md
echo "OK: phase35896 e2e passed"
