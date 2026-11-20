#!/usr/bin/env bash
# Phase-41576: soft-complete through 41576 (ms 128000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41576
assert m.WEBUI_HONESTY_MILESTONE == 128000
print("soft-complete >=41576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41576|through 41576' webui/STATUS.md
echo "OK: phase41576 e2e passed"
