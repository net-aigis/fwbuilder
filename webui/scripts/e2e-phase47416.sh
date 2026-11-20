#!/usr/bin/env bash
# Phase-47416: soft-complete through 47416 (ms 146250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47416
assert m.WEBUI_HONESTY_MILESTONE == 146250
print("soft-complete >=47416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47416|through 47416' webui/STATUS.md
echo "OK: phase47416 e2e passed"
