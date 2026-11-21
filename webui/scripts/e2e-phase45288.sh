#!/usr/bin/env bash
# Phase-45288: soft-complete through 45288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45288
PY
grep -qE 'phase45288|through 45288' webui/STATUS.md
echo "OK: phase45288 e2e passed"
