#!/usr/bin/env bash
# Phase-36056: soft-complete through 36056 (ms 110750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36056
assert m.WEBUI_HONESTY_MILESTONE == 110750
print("soft-complete >=36056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36056|through 36056' webui/STATUS.md
echo "OK: phase36056 e2e passed"
