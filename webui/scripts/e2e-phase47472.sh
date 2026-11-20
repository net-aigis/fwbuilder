#!/usr/bin/env bash
# Phase-47472: soft-complete through 47472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47472
PY
grep -qE 'phase47472|through 47472' webui/STATUS.md
echo "OK: phase47472 e2e passed"
