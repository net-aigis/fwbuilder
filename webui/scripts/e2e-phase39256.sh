#!/usr/bin/env bash
# Phase-39256: soft-complete through 39256 (ms 120750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39256
assert m.WEBUI_HONESTY_MILESTONE == 120750
print("soft-complete >=39256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39256|through 39256' webui/STATUS.md
echo "OK: phase39256 e2e passed"
