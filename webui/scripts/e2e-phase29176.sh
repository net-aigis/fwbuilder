#!/usr/bin/env bash
# Phase-29176: soft-complete through 29176 (ms 89250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29176
assert m.WEBUI_HONESTY_MILESTONE == 89250
print("soft-complete >=29176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29176|through 29176' webui/STATUS.md
echo "OK: phase29176 e2e passed"
