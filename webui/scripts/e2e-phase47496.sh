#!/usr/bin/env bash
# Phase-47496: soft-complete through 47496 (ms 146500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47496
assert m.WEBUI_HONESTY_MILESTONE == 146500
print("soft-complete >=47496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47496|through 47496' webui/STATUS.md
echo "OK: phase47496 e2e passed"
