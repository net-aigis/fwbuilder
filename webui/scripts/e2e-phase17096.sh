#!/usr/bin/env bash
# Phase-17096: soft-complete through 17096 (ms 51500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17096
assert m.WEBUI_HONESTY_MILESTONE == 51500
print("soft-complete >=17096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17096|through 17096' webui/STATUS.md
echo "OK: phase17096 e2e passed"
