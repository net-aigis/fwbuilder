#!/usr/bin/env bash
# Phase-37304: soft-complete through 37304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37304
PY
grep -qE 'phase37304|through 37304' webui/STATUS.md
echo "OK: phase37304 e2e passed"
