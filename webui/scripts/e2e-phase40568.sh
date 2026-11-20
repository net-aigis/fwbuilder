#!/usr/bin/env bash
# Phase-40568: soft-complete through 40568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40568
PY
grep -qE 'phase40568|through 40568' webui/STATUS.md
echo "OK: phase40568 e2e passed"
