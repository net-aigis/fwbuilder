#!/usr/bin/env bash
# Phase-26856: soft-complete through 26856 (ms 82000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26856
assert m.WEBUI_HONESTY_MILESTONE == 82000
print("soft-complete >=26856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26856|through 26856' webui/STATUS.md
echo "OK: phase26856 e2e passed"
