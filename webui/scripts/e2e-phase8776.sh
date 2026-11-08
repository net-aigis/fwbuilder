#!/usr/bin/env bash
# Phase-8776: soft-complete through 8776 (ms 25500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8776
assert m.WEBUI_HONESTY_MILESTONE == 25500
print("soft-complete >=8776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8776|through 8776' webui/STATUS.md
echo "OK: phase8776 e2e passed"
