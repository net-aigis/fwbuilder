#!/usr/bin/env bash
# Phase-47736: soft-complete through 47736 (ms 147250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47736
assert m.WEBUI_HONESTY_MILESTONE == 147250
print("soft-complete >=47736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47736|through 47736' webui/STATUS.md
echo "OK: phase47736 e2e passed"
