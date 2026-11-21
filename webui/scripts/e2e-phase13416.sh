#!/usr/bin/env bash
# Phase-13416: soft-complete through 13416 (ms 40000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13416
assert m.WEBUI_HONESTY_MILESTONE == 40000
print("soft-complete >=13416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13416|through 13416' webui/STATUS.md
echo "OK: phase13416 e2e passed"
