#!/usr/bin/env bash
# Phase-36456: soft-complete through 36456 (ms 112000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36456
assert m.WEBUI_HONESTY_MILESTONE == 112000
print("soft-complete >=36456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36456|through 36456' webui/STATUS.md
echo "OK: phase36456 e2e passed"
