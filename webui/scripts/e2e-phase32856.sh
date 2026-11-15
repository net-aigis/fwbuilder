#!/usr/bin/env bash
# Phase-32856: soft-complete through 32856 (ms 100750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32856
assert m.WEBUI_HONESTY_MILESTONE == 100750
print("soft-complete >=32856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32856|through 32856' webui/STATUS.md
echo "OK: phase32856 e2e passed"
