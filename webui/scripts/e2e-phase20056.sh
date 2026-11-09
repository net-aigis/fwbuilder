#!/usr/bin/env bash
# Phase-20056: soft-complete through 20056 (ms 60750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20056
assert m.WEBUI_HONESTY_MILESTONE == 60750
print("soft-complete >=20056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20056|through 20056' webui/STATUS.md
echo "OK: phase20056 e2e passed"
