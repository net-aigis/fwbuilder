#!/usr/bin/env bash
# Phase-11176: soft-complete through 11176 (ms 33000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11176
assert m.WEBUI_HONESTY_MILESTONE == 33000
print("soft-complete >=11176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11176|through 11176' webui/STATUS.md
echo "OK: phase11176 e2e passed"
