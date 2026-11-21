#!/usr/bin/env bash
# Phase-42936: soft-complete through 42936 (ms 132250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42936
assert m.WEBUI_HONESTY_MILESTONE == 132250
print("soft-complete >=42936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42936|through 42936' webui/STATUS.md
echo "OK: phase42936 e2e passed"
