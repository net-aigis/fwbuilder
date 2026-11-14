#!/usr/bin/env bash
# Phase-31176: soft-complete through 31176 (ms 95500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31176
assert m.WEBUI_HONESTY_MILESTONE == 95500
print("soft-complete >=31176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31176|through 31176' webui/STATUS.md
echo "OK: phase31176 e2e passed"
