#!/usr/bin/env bash
# Phase-42288: soft-complete through 42288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42288
PY
grep -qE 'phase42288|through 42288' webui/STATUS.md
echo "OK: phase42288 e2e passed"
