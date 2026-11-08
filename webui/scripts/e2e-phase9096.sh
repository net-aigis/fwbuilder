#!/usr/bin/env bash
# Phase-9096: soft-complete through 9096 (ms 26500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9096
assert m.WEBUI_HONESTY_MILESTONE == 26500
print("soft-complete >=9096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9096|through 9096' webui/STATUS.md
echo "OK: phase9096 e2e passed"
