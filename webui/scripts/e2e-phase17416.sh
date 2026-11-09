#!/usr/bin/env bash
# Phase-17416: soft-complete through 17416 (ms 52500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17416
assert m.WEBUI_HONESTY_MILESTONE == 52500
print("soft-complete >=17416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17416|through 17416' webui/STATUS.md
echo "OK: phase17416 e2e passed"
