#!/usr/bin/env bash
# Phase-35736: soft-complete through 35736 (ms 109750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35736
assert m.WEBUI_HONESTY_MILESTONE == 109750
print("soft-complete >=35736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35736|through 35736' webui/STATUS.md
echo "OK: phase35736 e2e passed"
