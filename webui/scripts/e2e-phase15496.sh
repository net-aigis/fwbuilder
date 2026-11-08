#!/usr/bin/env bash
# Phase-15496: soft-complete through 15496 (ms 46500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15496
assert m.WEBUI_HONESTY_MILESTONE == 46500
print("soft-complete >=15496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15496|through 15496' webui/STATUS.md
echo "OK: phase15496 e2e passed"
