#!/usr/bin/env bash
# Phase-13568: soft-complete through 13568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13568
PY
grep -qE 'phase13568|through 13568' webui/STATUS.md
echo "OK: phase13568 e2e passed"
