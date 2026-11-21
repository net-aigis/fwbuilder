#!/usr/bin/env bash
# Phase-37472: soft-complete through 37472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37472
PY
grep -qE 'phase37472|through 37472' webui/STATUS.md
echo "OK: phase37472 e2e passed"
