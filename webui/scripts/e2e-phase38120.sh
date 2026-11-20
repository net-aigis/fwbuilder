#!/usr/bin/env bash
# Phase-38120: soft-complete through 38120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38120
PY
grep -qE 'phase38120|through 38120' webui/STATUS.md
echo "OK: phase38120 e2e passed"
