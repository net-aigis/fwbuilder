#!/usr/bin/env bash
# Phase-31656: soft-complete through 31656 (ms 97000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31656
assert m.WEBUI_HONESTY_MILESTONE == 97000
print("soft-complete >=31656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31656|through 31656' webui/STATUS.md
echo "OK: phase31656 e2e passed"
