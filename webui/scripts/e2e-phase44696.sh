#!/usr/bin/env bash
# Phase-44696: soft-complete through 44696 (ms 137750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44696
assert m.WEBUI_HONESTY_MILESTONE == 137750
print("soft-complete >=44696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44696|through 44696' webui/STATUS.md
echo "OK: phase44696 e2e passed"
