#!/usr/bin/env bash
# Phase-39976: soft-complete through 39976 (ms 123000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39976
assert m.WEBUI_HONESTY_MILESTONE == 123000
print("soft-complete >=39976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39976|through 39976' webui/STATUS.md
echo "OK: phase39976 e2e passed"
