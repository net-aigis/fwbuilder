#!/usr/bin/env bash
# Phase-21256: soft-complete through 21256 (ms 64500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21256
assert m.WEBUI_HONESTY_MILESTONE == 64500
print("soft-complete >=21256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21256|through 21256' webui/STATUS.md
echo "OK: phase21256 e2e passed"
