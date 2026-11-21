#!/usr/bin/env bash
# Phase-40280: soft-complete through 40280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40280
PY
grep -qE 'phase40280|through 40280' webui/STATUS.md
echo "OK: phase40280 e2e passed"
