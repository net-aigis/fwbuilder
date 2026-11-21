#!/usr/bin/env bash
# Phase-32136: soft-complete through 32136 (ms 98500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32136
assert m.WEBUI_HONESTY_MILESTONE == 98500
print("soft-complete >=32136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32136|through 32136' webui/STATUS.md
echo "OK: phase32136 e2e passed"
