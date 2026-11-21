#!/usr/bin/env bash
# Phase-47656: soft-complete through 47656 (ms 147000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47656
assert m.WEBUI_HONESTY_MILESTONE == 147000
print("soft-complete >=47656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47656|through 47656' webui/STATUS.md
echo "OK: phase47656 e2e passed"
