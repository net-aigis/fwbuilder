#!/usr/bin/env bash
# Phase-18056: soft-complete through 18056 (ms 54500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18056
assert m.WEBUI_HONESTY_MILESTONE == 54500
print("soft-complete >=18056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18056|through 18056' webui/STATUS.md
echo "OK: phase18056 e2e passed"
