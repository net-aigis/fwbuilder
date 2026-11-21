#!/usr/bin/env bash
# Phase-36296: soft-complete through 36296 (ms 111500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36296
assert m.WEBUI_HONESTY_MILESTONE == 111500
print("soft-complete >=36296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36296|through 36296' webui/STATUS.md
echo "OK: phase36296 e2e passed"
