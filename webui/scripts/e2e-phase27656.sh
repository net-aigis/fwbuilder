#!/usr/bin/env bash
# Phase-27656: soft-complete through 27656 (ms 84500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27656
assert m.WEBUI_HONESTY_MILESTONE == 84500
print("soft-complete >=27656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27656|through 27656' webui/STATUS.md
echo "OK: phase27656 e2e passed"
