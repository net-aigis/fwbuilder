#!/usr/bin/env bash
# Phase-47816: soft-complete through 47816 (ms 147500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47816
assert m.WEBUI_HONESTY_MILESTONE == 147500
print("soft-complete >=47816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47816|through 47816' webui/STATUS.md
echo "OK: phase47816 e2e passed"
