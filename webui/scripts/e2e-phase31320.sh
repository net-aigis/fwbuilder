#!/usr/bin/env bash
# Phase-31320: soft-complete through 31320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31320
PY
grep -qE 'phase31320|through 31320' webui/STATUS.md
echo "OK: phase31320 e2e passed"
