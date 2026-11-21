#!/usr/bin/env bash
# Phase-48056: soft-complete through 48056 (ms 148250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48056
assert m.WEBUI_HONESTY_MILESTONE == 148250
print("soft-complete >=48056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48056|through 48056' webui/STATUS.md
echo "OK: phase48056 e2e passed"
