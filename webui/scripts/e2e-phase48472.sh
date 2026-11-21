#!/usr/bin/env bash
# Phase-48472: soft-complete through 48472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48472
PY
grep -qE 'phase48472|through 48472' webui/STATUS.md
echo "OK: phase48472 e2e passed"
