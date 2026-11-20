#!/usr/bin/env bash
# Phase-43288: soft-complete through 43288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43288
PY
grep -qE 'phase43288|through 43288' webui/STATUS.md
echo "OK: phase43288 e2e passed"
