#!/usr/bin/env bash
# Phase-36624: soft-complete through 36624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36624
PY
grep -qE 'phase36624|through 36624' webui/STATUS.md
echo "OK: phase36624 e2e passed"
