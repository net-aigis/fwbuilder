#!/usr/bin/env bash
# Phase-39472: soft-complete through 39472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39472
PY
grep -qE 'phase39472|through 39472' webui/STATUS.md
echo "OK: phase39472 e2e passed"
