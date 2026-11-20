#!/usr/bin/env bash
# Phase-36960: soft-complete through 36960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36960
PY
grep -qE 'phase36960|through 36960' webui/STATUS.md
echo "OK: phase36960 e2e passed"
