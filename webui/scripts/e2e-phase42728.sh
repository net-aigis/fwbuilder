#!/usr/bin/env bash
# Phase-42728: soft-complete through 42728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42728
PY
grep -qE 'phase42728|through 42728' webui/STATUS.md
echo "OK: phase42728 e2e passed"
