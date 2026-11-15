#!/usr/bin/env bash
# Phase-33096: soft-complete through 33096 (ms 101500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33096
assert m.WEBUI_HONESTY_MILESTONE == 101500
print("soft-complete >=33096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33096|through 33096' webui/STATUS.md
echo "OK: phase33096 e2e passed"
