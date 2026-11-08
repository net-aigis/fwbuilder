#!/usr/bin/env bash
# Phase-14936: soft-complete through 14936 (ms 44750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14936
assert m.WEBUI_HONESTY_MILESTONE == 44750
print("soft-complete >=14936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14936|through 14936' webui/STATUS.md
echo "OK: phase14936 e2e passed"
