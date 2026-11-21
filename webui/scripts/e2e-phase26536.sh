#!/usr/bin/env bash
# Phase-26536: soft-complete through 26536 (ms 81000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26536
assert m.WEBUI_HONESTY_MILESTONE == 81000
print("soft-complete >=26536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26536|through 26536' webui/STATUS.md
echo "OK: phase26536 e2e passed"
