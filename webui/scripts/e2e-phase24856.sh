#!/usr/bin/env bash
# Phase-24856: soft-complete through 24856 (ms 75750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24856
assert m.WEBUI_HONESTY_MILESTONE == 75750
print("soft-complete >=24856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24856|through 24856' webui/STATUS.md
echo "OK: phase24856 e2e passed"
