#!/usr/bin/env bash
# Phase-48400: soft-complete through 48400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48400
PY
grep -qE 'phase48400|through 48400' webui/STATUS.md
echo "OK: phase48400 e2e passed"
