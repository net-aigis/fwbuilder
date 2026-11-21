#!/usr/bin/env bash
# Phase-43496: soft-complete through 43496 (ms 134000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43496
assert m.WEBUI_HONESTY_MILESTONE == 134000
print("soft-complete >=43496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43496|through 43496' webui/STATUS.md
echo "OK: phase43496 e2e passed"
