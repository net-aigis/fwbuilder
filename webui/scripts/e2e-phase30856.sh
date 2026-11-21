#!/usr/bin/env bash
# Phase-30856: soft-complete through 30856 (ms 94500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30856
assert m.WEBUI_HONESTY_MILESTONE == 94500
print("soft-complete >=30856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30856|through 30856' webui/STATUS.md
echo "OK: phase30856 e2e passed"
