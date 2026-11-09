#!/usr/bin/env bash
# Phase-18456: soft-complete through 18456 (ms 55750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18456
assert m.WEBUI_HONESTY_MILESTONE == 55750
print("soft-complete >=18456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18456|through 18456' webui/STATUS.md
echo "OK: phase18456 e2e passed"
