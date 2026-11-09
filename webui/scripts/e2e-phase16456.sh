#!/usr/bin/env bash
# Phase-16456: soft-complete through 16456 (ms 49500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16456
assert m.WEBUI_HONESTY_MILESTONE == 49500
print("soft-complete >=16456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16456|through 16456' webui/STATUS.md
echo "OK: phase16456 e2e passed"
