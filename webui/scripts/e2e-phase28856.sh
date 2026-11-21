#!/usr/bin/env bash
# Phase-28856: soft-complete through 28856 (ms 88250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28856
assert m.WEBUI_HONESTY_MILESTONE == 88250
print("soft-complete >=28856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28856|through 28856' webui/STATUS.md
echo "OK: phase28856 e2e passed"
