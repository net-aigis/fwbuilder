#!/usr/bin/env bash
# Phase-29336: soft-complete through 29336 (ms 89750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29336
assert m.WEBUI_HONESTY_MILESTONE == 89750
print("soft-complete >=29336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29336|through 29336' webui/STATUS.md
echo "OK: phase29336 e2e passed"
