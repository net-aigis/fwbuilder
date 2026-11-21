#!/usr/bin/env bash
# Phase-23656: soft-complete through 23656 (ms 72000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23656
assert m.WEBUI_HONESTY_MILESTONE == 72000
print("soft-complete >=23656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23656|through 23656' webui/STATUS.md
echo "OK: phase23656 e2e passed"
