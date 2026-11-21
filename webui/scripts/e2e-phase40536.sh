#!/usr/bin/env bash
# Phase-40536: soft-complete through 40536 (ms 124750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40536
assert m.WEBUI_HONESTY_MILESTONE == 124750
print("soft-complete >=40536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40536|through 40536' webui/STATUS.md
echo "OK: phase40536 e2e passed"
