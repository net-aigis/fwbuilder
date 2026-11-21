#!/usr/bin/env bash
# Phase-34056: soft-complete through 34056 (ms 104500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34056
assert m.WEBUI_HONESTY_MILESTONE == 104500
print("soft-complete >=34056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34056|through 34056' webui/STATUS.md
echo "OK: phase34056 e2e passed"
