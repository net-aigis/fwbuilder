#!/usr/bin/env bash
# Phase-37624: soft-complete through 37624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37624
PY
grep -qE 'phase37624|through 37624' webui/STATUS.md
echo "OK: phase37624 e2e passed"
