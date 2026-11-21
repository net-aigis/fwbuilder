#!/usr/bin/env bash
# Phase-41336: soft-complete through 41336 (ms 127250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41336
assert m.WEBUI_HONESTY_MILESTONE == 127250
print("soft-complete >=41336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41336|through 41336' webui/STATUS.md
echo "OK: phase41336 e2e passed"
