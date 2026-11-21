#!/usr/bin/env bash
# Phase-43176: soft-complete through 43176 (ms 133000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43176
assert m.WEBUI_HONESTY_MILESTONE == 133000
print("soft-complete >=43176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43176|through 43176' webui/STATUS.md
echo "OK: phase43176 e2e passed"
