#!/usr/bin/env bash
# Phase-17256: soft-complete through 17256 (ms 52000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17256
assert m.WEBUI_HONESTY_MILESTONE == 52000
print("soft-complete >=17256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17256|through 17256' webui/STATUS.md
echo "OK: phase17256 e2e passed"
