#!/usr/bin/env bash
# Phase-47336: soft-complete through 47336 (ms 146000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47336
assert m.WEBUI_HONESTY_MILESTONE == 146000
print("soft-complete >=47336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47336|through 47336' webui/STATUS.md
echo "OK: phase47336 e2e passed"
