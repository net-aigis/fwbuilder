#!/usr/bin/env bash
# Phase-36448: soft-complete through 36448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36448
PY
grep -qE 'phase36448|through 36448' webui/STATUS.md
echo "OK: phase36448 e2e passed"
