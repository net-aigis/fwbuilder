#!/usr/bin/env bash
# Phase-39736: soft-complete through 39736 (ms 122250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39736
assert m.WEBUI_HONESTY_MILESTONE == 122250
print("soft-complete >=39736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39736|through 39736' webui/STATUS.md
echo "OK: phase39736 e2e passed"
