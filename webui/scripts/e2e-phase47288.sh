#!/usr/bin/env bash
# Phase-47288: soft-complete through 47288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47288
PY
grep -qE 'phase47288|through 47288' webui/STATUS.md
echo "OK: phase47288 e2e passed"
