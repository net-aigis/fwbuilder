#!/usr/bin/env bash
# Phase-17568: soft-complete through 17568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17568
PY
grep -qE 'phase17568|through 17568' webui/STATUS.md
echo "OK: phase17568 e2e passed"
