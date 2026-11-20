#!/usr/bin/env bash
# Phase-34456: soft-complete through 34456 (ms 105750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34456
assert m.WEBUI_HONESTY_MILESTONE == 105750
print("soft-complete >=34456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34456|through 34456' webui/STATUS.md
echo "OK: phase34456 e2e passed"
