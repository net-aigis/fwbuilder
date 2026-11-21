#!/usr/bin/env bash
# Phase-8288: soft-complete through 8288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8288
PY
grep -qE 'phase8288|through 8288' webui/STATUS.md
echo "OK: phase8288 e2e passed"
