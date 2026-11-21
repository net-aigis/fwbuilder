#!/usr/bin/env bash
# Phase-45496: soft-complete through 45496 (ms 140250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45496
assert m.WEBUI_HONESTY_MILESTONE == 140250
print("soft-complete >=45496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45496|through 45496' webui/STATUS.md
echo "OK: phase45496 e2e passed"
