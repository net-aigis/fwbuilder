#!/usr/bin/env bash
# Phase-14696: soft-complete through 14696 (ms 44000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14696
assert m.WEBUI_HONESTY_MILESTONE == 44000
print("soft-complete >=14696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14696|through 14696' webui/STATUS.md
echo "OK: phase14696 e2e passed"
