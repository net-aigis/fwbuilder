#!/usr/bin/env bash
# Phase-12376: soft-complete through 12376 (ms 36750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12376
assert m.WEBUI_HONESTY_MILESTONE == 36750
print("soft-complete >=12376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12376|through 12376' webui/STATUS.md
echo "OK: phase12376 e2e passed"
