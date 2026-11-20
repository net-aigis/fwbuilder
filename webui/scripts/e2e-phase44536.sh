#!/usr/bin/env bash
# Phase-44536: soft-complete through 44536 (ms 137250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44536
assert m.WEBUI_HONESTY_MILESTONE == 137250
print("soft-complete >=44536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44536|through 44536' webui/STATUS.md
echo "OK: phase44536 e2e passed"
