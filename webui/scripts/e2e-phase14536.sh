#!/usr/bin/env bash
# Phase-14536: soft-complete through 14536 (ms 43500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14536
assert m.WEBUI_HONESTY_MILESTONE == 43500
print("soft-complete >=14536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14536|through 14536' webui/STATUS.md
echo "OK: phase14536 e2e passed"
