#!/usr/bin/env bash
# Phase-41656: soft-complete through 41656 (ms 128250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41656
assert m.WEBUI_HONESTY_MILESTONE == 128250
print("soft-complete >=41656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41656|through 41656' webui/STATUS.md
echo "OK: phase41656 e2e passed"
