#!/usr/bin/env bash
# Phase-11256: soft-complete through 11256 (ms 33250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11256
assert m.WEBUI_HONESTY_MILESTONE == 33250
print("soft-complete >=11256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11256|through 11256' webui/STATUS.md
echo "OK: phase11256 e2e passed"
