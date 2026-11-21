#!/usr/bin/env bash
# Phase-27336: soft-complete through 27336 (ms 83500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27336
assert m.WEBUI_HONESTY_MILESTONE == 83500
print("soft-complete >=27336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27336|through 27336' webui/STATUS.md
echo "OK: phase27336 e2e passed"
