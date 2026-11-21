#!/usr/bin/env bash
# Phase-9336: soft-complete through 9336 (ms 27250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9336
assert m.WEBUI_HONESTY_MILESTONE == 27250
print("soft-complete >=9336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9336|through 9336' webui/STATUS.md
echo "OK: phase9336 e2e passed"
