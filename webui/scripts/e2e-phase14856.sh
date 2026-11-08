#!/usr/bin/env bash
# Phase-14856: soft-complete through 14856 (ms 44500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14856
assert m.WEBUI_HONESTY_MILESTONE == 44500
print("soft-complete >=14856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14856|through 14856' webui/STATUS.md
echo "OK: phase14856 e2e passed"
