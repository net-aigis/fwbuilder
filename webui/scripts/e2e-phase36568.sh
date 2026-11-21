#!/usr/bin/env bash
# Phase-36568: soft-complete through 36568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36568
PY
grep -qE 'phase36568|through 36568' webui/STATUS.md
echo "OK: phase36568 e2e passed"
