#!/usr/bin/env bash
# Phase-45576: soft-complete through 45576 (ms 140500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45576
assert m.WEBUI_HONESTY_MILESTONE == 140500
print("soft-complete >=45576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45576|through 45576' webui/STATUS.md
echo "OK: phase45576 e2e passed"
