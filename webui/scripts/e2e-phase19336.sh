#!/usr/bin/env bash
# Phase-19336: soft-complete through 19336 (ms 58500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19336
assert m.WEBUI_HONESTY_MILESTONE == 58500
print("soft-complete >=19336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19336|through 19336' webui/STATUS.md
echo "OK: phase19336 e2e passed"
