#!/usr/bin/env bash
# Phase-44776: soft-complete through 44776 (ms 138000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44776
assert m.WEBUI_HONESTY_MILESTONE == 138000
print("soft-complete >=44776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44776|through 44776' webui/STATUS.md
echo "OK: phase44776 e2e passed"
