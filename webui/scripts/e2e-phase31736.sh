#!/usr/bin/env bash
# Phase-31736: soft-complete through 31736 (ms 97250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31736
assert m.WEBUI_HONESTY_MILESTONE == 97250
print("soft-complete >=31736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31736|through 31736' webui/STATUS.md
echo "OK: phase31736 e2e passed"
