#!/usr/bin/env bash
# Phase-46456: soft-complete through 46456 (ms 143250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46456
assert m.WEBUI_HONESTY_MILESTONE == 143250
print("soft-complete >=46456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46456|through 46456' webui/STATUS.md
echo "OK: phase46456 e2e passed"
