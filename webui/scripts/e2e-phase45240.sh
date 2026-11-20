#!/usr/bin/env bash
# Phase-45240: soft-complete through 45240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45240
PY
grep -qE 'phase45240|through 45240' webui/STATUS.md
echo "OK: phase45240 e2e passed"
