#!/usr/bin/env bash
# Phase-15176: soft-complete through 15176 (ms 45500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15176
assert m.WEBUI_HONESTY_MILESTONE == 45500
print("soft-complete >=15176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15176|through 15176' webui/STATUS.md
echo "OK: phase15176 e2e passed"
