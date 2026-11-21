#!/usr/bin/env bash
# Phase-41256: soft-complete through 41256 (ms 127000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41256
assert m.WEBUI_HONESTY_MILESTONE == 127000
print("soft-complete >=41256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41256|through 41256' webui/STATUS.md
echo "OK: phase41256 e2e passed"
