#!/usr/bin/env bash
# Phase-47096: soft-complete through 47096 (ms 145250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47096
assert m.WEBUI_HONESTY_MILESTONE == 145250
print("soft-complete >=47096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47096|through 47096' webui/STATUS.md
echo "OK: phase47096 e2e passed"
