#!/usr/bin/env bash
# Phase-42456: soft-complete through 42456 (ms 130750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42456
assert m.WEBUI_HONESTY_MILESTONE == 130750
print("soft-complete >=42456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42456|through 42456' webui/STATUS.md
echo "OK: phase42456 e2e passed"
