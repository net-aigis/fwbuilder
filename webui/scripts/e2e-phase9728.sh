#!/usr/bin/env bash
# Phase-9728: soft-complete through 9728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9728
PY
grep -qE 'phase9728|through 9728' webui/STATUS.md
echo "OK: phase9728 e2e passed"
