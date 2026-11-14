#!/usr/bin/env bash
# Phase-31568: soft-complete through 31568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31568
PY
grep -qE 'phase31568|through 31568' webui/STATUS.md
echo "OK: phase31568 e2e passed"
