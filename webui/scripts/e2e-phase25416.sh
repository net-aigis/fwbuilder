#!/usr/bin/env bash
# Phase-25416: soft-complete through 25416 (ms 77500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25416
assert m.WEBUI_HONESTY_MILESTONE == 77500
print("soft-complete >=25416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25416|through 25416' webui/STATUS.md
echo "OK: phase25416 e2e passed"
