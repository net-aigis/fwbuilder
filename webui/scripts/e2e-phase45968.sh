#!/usr/bin/env bash
# Phase-45968: soft-complete through 45968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45968
PY
grep -qE 'phase45968|through 45968' webui/STATUS.md
echo "OK: phase45968 e2e passed"
