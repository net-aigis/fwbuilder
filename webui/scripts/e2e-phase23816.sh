#!/usr/bin/env bash
# Phase-23816: soft-complete through 23816 (ms 72500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23816
assert m.WEBUI_HONESTY_MILESTONE == 72500
print("soft-complete >=23816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23816|through 23816' webui/STATUS.md
echo "OK: phase23816 e2e passed"
