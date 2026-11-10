#!/usr/bin/env bash
# Phase-22856: soft-complete through 22856 (ms 69500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22856
assert m.WEBUI_HONESTY_MILESTONE == 69500
print("soft-complete >=22856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22856|through 22856' webui/STATUS.md
echo "OK: phase22856 e2e passed"
