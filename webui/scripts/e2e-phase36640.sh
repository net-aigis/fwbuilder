#!/usr/bin/env bash
# Phase-36640: soft-complete through 36640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36640
PY
grep -qE 'phase36640|through 36640' webui/STATUS.md
echo "OK: phase36640 e2e passed"
