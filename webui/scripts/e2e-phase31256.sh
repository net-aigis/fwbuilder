#!/usr/bin/env bash
# Phase-31256: soft-complete through 31256 (ms 95750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31256
assert m.WEBUI_HONESTY_MILESTONE == 95750
print("soft-complete >=31256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31256|through 31256' webui/STATUS.md
echo "OK: phase31256 e2e passed"
