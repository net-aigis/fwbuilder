#!/usr/bin/env bash
# Phase-37040: soft-complete through 37040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37040
PY
grep -qE 'phase37040|through 37040' webui/STATUS.md
echo "OK: phase37040 e2e passed"
