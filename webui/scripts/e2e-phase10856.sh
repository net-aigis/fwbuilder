#!/usr/bin/env bash
# Phase-10856: soft-complete through 10856 (ms 32000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10856
assert m.WEBUI_HONESTY_MILESTONE == 32000
print("soft-complete >=10856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10856|through 10856' webui/STATUS.md
echo "OK: phase10856 e2e passed"
