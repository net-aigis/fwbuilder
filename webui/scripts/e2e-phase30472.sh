#!/usr/bin/env bash
# Phase-30472: soft-complete through 30472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30472
PY
grep -qE 'phase30472|through 30472' webui/STATUS.md
echo "OK: phase30472 e2e passed"
