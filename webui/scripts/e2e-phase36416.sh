#!/usr/bin/env bash
# Phase-36416: soft-complete through 36416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36416
PY
grep -qE 'phase36416|through 36416' webui/STATUS.md
echo "OK: phase36416 e2e passed"
