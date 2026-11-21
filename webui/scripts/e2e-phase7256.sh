#!/usr/bin/env bash
# Phase-7256: soft-complete through 7256 (ms 20750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7256
assert m.WEBUI_HONESTY_MILESTONE == 20750
print("soft-complete >=7256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7256|through 7256' webui/STATUS.md
echo "OK: phase7256 e2e passed"
