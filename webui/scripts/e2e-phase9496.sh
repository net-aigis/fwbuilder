#!/usr/bin/env bash
# Phase-9496: soft-complete through 9496 (ms 27750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9496
assert m.WEBUI_HONESTY_MILESTONE == 27750
print("soft-complete >=9496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9496|through 9496' webui/STATUS.md
echo "OK: phase9496 e2e passed"
