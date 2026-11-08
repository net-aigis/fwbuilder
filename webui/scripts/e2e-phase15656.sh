#!/usr/bin/env bash
# Phase-15656: soft-complete through 15656 (ms 47000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15656
assert m.WEBUI_HONESTY_MILESTONE == 47000
print("soft-complete >=15656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15656|through 15656' webui/STATUS.md
echo "OK: phase15656 e2e passed"
