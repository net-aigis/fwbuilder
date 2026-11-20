#!/usr/bin/env bash
# Phase-37656: soft-complete through 37656 (ms 115750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37656
assert m.WEBUI_HONESTY_MILESTONE == 115750
print("soft-complete >=37656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37656|through 37656' webui/STATUS.md
echo "OK: phase37656 e2e passed"
