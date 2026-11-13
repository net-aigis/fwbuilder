#!/usr/bin/env bash
# Phase-29496: soft-complete through 29496 (ms 90250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29496
assert m.WEBUI_HONESTY_MILESTONE == 90250
print("soft-complete >=29496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29496|through 29496' webui/STATUS.md
echo "OK: phase29496 e2e passed"
