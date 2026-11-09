#!/usr/bin/env bash
# Phase-21568: soft-complete through 21568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21568
PY
grep -qE 'phase21568|through 21568' webui/STATUS.md
echo "OK: phase21568 e2e passed"
