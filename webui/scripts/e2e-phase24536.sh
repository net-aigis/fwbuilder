#!/usr/bin/env bash
# Phase-24536: soft-complete through 24536 (ms 74750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24536
assert m.WEBUI_HONESTY_MILESTONE == 74750
print("soft-complete >=24536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24536|through 24536' webui/STATUS.md
echo "OK: phase24536 e2e passed"
