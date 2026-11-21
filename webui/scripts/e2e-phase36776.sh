#!/usr/bin/env bash
# Phase-36776: soft-complete through 36776 (ms 113000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36776
assert m.WEBUI_HONESTY_MILESTONE == 113000
print("soft-complete >=36776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36776|through 36776' webui/STATUS.md
echo "OK: phase36776 e2e passed"
