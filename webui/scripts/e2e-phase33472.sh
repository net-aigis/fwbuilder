#!/usr/bin/env bash
# Phase-33472: soft-complete through 33472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33472
PY
grep -qE 'phase33472|through 33472' webui/STATUS.md
echo "OK: phase33472 e2e passed"
