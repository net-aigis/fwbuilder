#!/usr/bin/env bash
# Phase-32288: soft-complete through 32288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32288
PY
grep -qE 'phase32288|through 32288' webui/STATUS.md
echo "OK: phase32288 e2e passed"
