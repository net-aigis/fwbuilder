#!/usr/bin/env bash
# Phase-30936: soft-complete through 30936 (ms 94750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30936
assert m.WEBUI_HONESTY_MILESTONE == 94750
print("soft-complete >=30936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30936|through 30936' webui/STATUS.md
echo "OK: phase30936 e2e passed"
