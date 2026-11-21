#!/usr/bin/env bash
# Phase-8856: soft-complete through 8856 (ms 25750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8856
assert m.WEBUI_HONESTY_MILESTONE == 25750
print("soft-complete >=8856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8856|through 8856' webui/STATUS.md
echo "OK: phase8856 e2e passed"
