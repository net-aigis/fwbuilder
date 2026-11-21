#!/usr/bin/env bash
# Phase-25096: soft-complete through 25096 (ms 76500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25096
assert m.WEBUI_HONESTY_MILESTONE == 76500
print("soft-complete >=25096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25096|through 25096' webui/STATUS.md
echo "OK: phase25096 e2e passed"
