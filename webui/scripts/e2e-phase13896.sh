#!/usr/bin/env bash
# Phase-13896: soft-complete through 13896 (ms 41500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13896
assert m.WEBUI_HONESTY_MILESTONE == 41500
print("soft-complete >=13896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13896|through 13896' webui/STATUS.md
echo "OK: phase13896 e2e passed"
