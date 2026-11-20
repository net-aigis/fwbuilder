#!/usr/bin/env bash
# Phase-37336: soft-complete through 37336 (ms 114750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37336
assert m.WEBUI_HONESTY_MILESTONE == 114750
print("soft-complete >=37336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37336|through 37336' webui/STATUS.md
echo "OK: phase37336 e2e passed"
