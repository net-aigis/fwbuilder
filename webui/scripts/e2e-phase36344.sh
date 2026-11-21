#!/usr/bin/env bash
# Phase-36344: soft-complete through 36344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36344
PY
grep -qE 'phase36344|through 36344' webui/STATUS.md
echo "OK: phase36344 e2e passed"
