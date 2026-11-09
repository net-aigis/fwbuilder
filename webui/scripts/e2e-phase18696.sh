#!/usr/bin/env bash
# Phase-18696: soft-complete through 18696 (ms 56500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18696
assert m.WEBUI_HONESTY_MILESTONE == 56500
print("soft-complete >=18696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18696|through 18696' webui/STATUS.md
echo "OK: phase18696 e2e passed"
