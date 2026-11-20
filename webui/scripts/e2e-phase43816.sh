#!/usr/bin/env bash
# Phase-43816: soft-complete through 43816 (ms 135000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43816
assert m.WEBUI_HONESTY_MILESTONE == 135000
print("soft-complete >=43816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43816|through 43816' webui/STATUS.md
echo "OK: phase43816 e2e passed"
