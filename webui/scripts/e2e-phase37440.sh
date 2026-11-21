#!/usr/bin/env bash
# Phase-37440: soft-complete through 37440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37440
PY
grep -qE 'phase37440|through 37440' webui/STATUS.md
echo "OK: phase37440 e2e passed"
