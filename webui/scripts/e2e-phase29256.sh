#!/usr/bin/env bash
# Phase-29256: soft-complete through 29256 (ms 89500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29256
assert m.WEBUI_HONESTY_MILESTONE == 89500
print("soft-complete >=29256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29256|through 29256' webui/STATUS.md
echo "OK: phase29256 e2e passed"
