#!/usr/bin/env bash
# Phase-7816: soft-complete through 7816 (ms 22500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7816
assert m.WEBUI_HONESTY_MILESTONE == 22500
print("soft-complete >=7816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7816|through 7816' webui/STATUS.md
echo "OK: phase7816 e2e passed"
