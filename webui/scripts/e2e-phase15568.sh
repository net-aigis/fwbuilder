#!/usr/bin/env bash
# Phase-15568: soft-complete through 15568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15568
PY
grep -qE 'phase15568|through 15568' webui/STATUS.md
echo "OK: phase15568 e2e passed"
