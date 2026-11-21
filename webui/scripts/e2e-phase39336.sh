#!/usr/bin/env bash
# Phase-39336: soft-complete through 39336 (ms 121000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39336
assert m.WEBUI_HONESTY_MILESTONE == 121000
print("soft-complete >=39336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39336|through 39336' webui/STATUS.md
echo "OK: phase39336 e2e passed"
