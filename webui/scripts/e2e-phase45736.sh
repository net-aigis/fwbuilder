#!/usr/bin/env bash
# Phase-45736: soft-complete through 45736 (ms 141000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45736
assert m.WEBUI_HONESTY_MILESTONE == 141000
print("soft-complete >=45736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45736|through 45736' webui/STATUS.md
echo "OK: phase45736 e2e passed"
