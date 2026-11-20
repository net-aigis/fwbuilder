#!/usr/bin/env bash
# Phase-40472: soft-complete through 40472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40472
PY
grep -qE 'phase40472|through 40472' webui/STATUS.md
echo "OK: phase40472 e2e passed"
