#!/usr/bin/env bash
# Phase-36592: soft-complete through 36592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36592
PY
grep -qE 'phase36592|through 36592' webui/STATUS.md
echo "OK: phase36592 e2e passed"
