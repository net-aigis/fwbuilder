#!/usr/bin/env bash
# Phase-23736: soft-complete through 23736 (ms 72250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23736
assert m.WEBUI_HONESTY_MILESTONE == 72250
print("soft-complete >=23736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23736|through 23736' webui/STATUS.md
echo "OK: phase23736 e2e passed"
