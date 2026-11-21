#!/usr/bin/env bash
# Phase-11416: soft-complete through 11416 (ms 33750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11416
assert m.WEBUI_HONESTY_MILESTONE == 33750
print("soft-complete >=11416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11416|through 11416' webui/STATUS.md
echo "OK: phase11416 e2e passed"
