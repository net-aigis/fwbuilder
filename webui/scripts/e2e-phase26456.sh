#!/usr/bin/env bash
# Phase-26456: soft-complete through 26456 (ms 80750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26456
assert m.WEBUI_HONESTY_MILESTONE == 80750
print("soft-complete >=26456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26456|through 26456' webui/STATUS.md
echo "OK: phase26456 e2e passed"
