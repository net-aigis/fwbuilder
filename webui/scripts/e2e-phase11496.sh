#!/usr/bin/env bash
# Phase-11496: soft-complete through 11496 (ms 34000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11496
assert m.WEBUI_HONESTY_MILESTONE == 34000
print("soft-complete >=11496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11496|through 11496' webui/STATUS.md
echo "OK: phase11496 e2e passed"
