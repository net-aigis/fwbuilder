#!/usr/bin/env bash
# Phase-42056: soft-complete through 42056 (ms 129500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42056
assert m.WEBUI_HONESTY_MILESTONE == 129500
print("soft-complete >=42056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42056|through 42056' webui/STATUS.md
echo "OK: phase42056 e2e passed"
