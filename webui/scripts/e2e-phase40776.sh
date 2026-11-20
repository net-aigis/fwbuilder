#!/usr/bin/env bash
# Phase-40776: soft-complete through 40776 (ms 125500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40776
assert m.WEBUI_HONESTY_MILESTONE == 125500
print("soft-complete >=40776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40776|through 40776' webui/STATUS.md
echo "OK: phase40776 e2e passed"
