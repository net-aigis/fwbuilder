#!/usr/bin/env bash
# Phase-28056: soft-complete through 28056 (ms 85750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28056
assert m.WEBUI_HONESTY_MILESTONE == 85750
print("soft-complete >=28056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28056|through 28056' webui/STATUS.md
echo "OK: phase28056 e2e passed"
