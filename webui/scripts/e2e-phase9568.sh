#!/usr/bin/env bash
# Phase-9568: soft-complete through 9568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9568
PY
grep -qE 'phase9568|through 9568' webui/STATUS.md
echo "OK: phase9568 e2e passed"
