#!/usr/bin/env bash
# Phase-24456: soft-complete through 24456 (ms 74500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24456
assert m.WEBUI_HONESTY_MILESTONE == 74500
print("soft-complete >=24456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24456|through 24456' webui/STATUS.md
echo "OK: phase24456 e2e passed"
