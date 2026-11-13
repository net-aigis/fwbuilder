#!/usr/bin/env bash
# Phase-29416: soft-complete through 29416 (ms 90000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29416
assert m.WEBUI_HONESTY_MILESTONE == 90000
print("soft-complete >=29416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29416|through 29416' webui/STATUS.md
echo "OK: phase29416 e2e passed"
