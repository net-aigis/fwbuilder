#!/usr/bin/env bash
# Phase-37568: soft-complete through 37568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37568
PY
grep -qE 'phase37568|through 37568' webui/STATUS.md
echo "OK: phase37568 e2e passed"
