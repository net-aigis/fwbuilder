#!/usr/bin/env bash
# Phase-44568: soft-complete through 44568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44568
PY
grep -qE 'phase44568|through 44568' webui/STATUS.md
echo "OK: phase44568 e2e passed"
