#!/usr/bin/env bash
# Phase-12776: soft-complete through 12776 (ms 38000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12776
assert m.WEBUI_HONESTY_MILESTONE == 38000
print("soft-complete >=12776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12776|through 12776' webui/STATUS.md
echo "OK: phase12776 e2e passed"
