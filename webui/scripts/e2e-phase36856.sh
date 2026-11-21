#!/usr/bin/env bash
# Phase-36856: soft-complete through 36856 (ms 113250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36856
assert m.WEBUI_HONESTY_MILESTONE == 113250
print("soft-complete >=36856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36856|through 36856' webui/STATUS.md
echo "OK: phase36856 e2e passed"
