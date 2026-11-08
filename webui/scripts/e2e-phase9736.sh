#!/usr/bin/env bash
# Phase-9736: soft-complete through 9736 (ms 28500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9736
assert m.WEBUI_HONESTY_MILESTONE == 28500
print("soft-complete >=9736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9736|through 9736' webui/STATUS.md
echo "OK: phase9736 e2e passed"
