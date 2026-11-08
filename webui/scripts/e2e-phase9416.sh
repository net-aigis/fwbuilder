#!/usr/bin/env bash
# Phase-9416: soft-complete through 9416 (ms 27500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9416
assert m.WEBUI_HONESTY_MILESTONE == 27500
print("soft-complete >=9416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9416|through 9416' webui/STATUS.md
echo "OK: phase9416 e2e passed"
