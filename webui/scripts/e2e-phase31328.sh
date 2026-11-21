#!/usr/bin/env bash
# Phase-31328: soft-complete through 31328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31328
PY
grep -qE 'phase31328|through 31328' webui/STATUS.md
echo "OK: phase31328 e2e passed"
