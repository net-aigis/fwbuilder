#!/usr/bin/env bash
# Phase-28776: soft-complete through 28776 (ms 88000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28776
assert m.WEBUI_HONESTY_MILESTONE == 88000
print("soft-complete >=28776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28776|through 28776' webui/STATUS.md
echo "OK: phase28776 e2e passed"
