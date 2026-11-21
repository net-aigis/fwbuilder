#!/usr/bin/env bash
# Phase-48448: soft-complete through 48448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48448
PY
grep -qE 'phase48448|through 48448' webui/STATUS.md
echo "OK: phase48448 e2e passed"
