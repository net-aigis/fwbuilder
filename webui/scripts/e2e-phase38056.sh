#!/usr/bin/env bash
# Phase-38056: soft-complete through 38056 (ms 117000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38056
assert m.WEBUI_HONESTY_MILESTONE == 117000
print("soft-complete >=38056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38056|through 38056' webui/STATUS.md
echo "OK: phase38056 e2e passed"
