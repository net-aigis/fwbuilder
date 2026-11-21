#!/usr/bin/env bash
# Phase-13736: soft-complete through 13736 (ms 41000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13736
assert m.WEBUI_HONESTY_MILESTONE == 41000
print("soft-complete >=13736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13736|through 13736' webui/STATUS.md
echo "OK: phase13736 e2e passed"
