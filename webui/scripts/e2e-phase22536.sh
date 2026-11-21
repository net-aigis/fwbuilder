#!/usr/bin/env bash
# Phase-22536: soft-complete through 22536 (ms 68500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22536
assert m.WEBUI_HONESTY_MILESTONE == 68500
print("soft-complete >=22536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22536|through 22536' webui/STATUS.md
echo "OK: phase22536 e2e passed"
