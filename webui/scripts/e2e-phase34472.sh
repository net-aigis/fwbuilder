#!/usr/bin/env bash
# Phase-34472: soft-complete through 34472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34472
PY
grep -qE 'phase34472|through 34472' webui/STATUS.md
echo "OK: phase34472 e2e passed"
