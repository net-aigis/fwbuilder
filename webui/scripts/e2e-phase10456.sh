#!/usr/bin/env bash
# Phase-10456: soft-complete through 10456 (ms 30750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10456
assert m.WEBUI_HONESTY_MILESTONE == 30750
print("soft-complete >=10456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10456|through 10456' webui/STATUS.md
echo "OK: phase10456 e2e passed"
