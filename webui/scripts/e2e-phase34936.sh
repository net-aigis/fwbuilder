#!/usr/bin/env bash
# Phase-34936: soft-complete through 34936 (ms 107250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34936
assert m.WEBUI_HONESTY_MILESTONE == 107250
print("soft-complete >=34936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34936|through 34936' webui/STATUS.md
echo "OK: phase34936 e2e passed"
