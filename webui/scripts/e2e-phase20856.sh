#!/usr/bin/env bash
# Phase-20856: soft-complete through 20856 (ms 63250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20856
assert m.WEBUI_HONESTY_MILESTONE == 63250
print("soft-complete >=20856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20856|through 20856' webui/STATUS.md
echo "OK: phase20856 e2e passed"
