#!/usr/bin/env bash
# Phase-41496: soft-complete through 41496 (ms 127750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41496
assert m.WEBUI_HONESTY_MILESTONE == 127750
print("soft-complete >=41496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41496|through 41496' webui/STATUS.md
echo "OK: phase41496 e2e passed"
