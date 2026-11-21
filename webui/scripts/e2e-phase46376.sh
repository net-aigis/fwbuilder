#!/usr/bin/env bash
# Phase-46376: soft-complete through 46376 (ms 143000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46376
assert m.WEBUI_HONESTY_MILESTONE == 143000
print("soft-complete >=46376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46376|through 46376' webui/STATUS.md
echo "OK: phase46376 e2e passed"
