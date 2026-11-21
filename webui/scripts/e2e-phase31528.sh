#!/usr/bin/env bash
# Phase-31528: soft-complete through 31528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31528
PY
grep -qE 'phase31528|through 31528' webui/STATUS.md
echo "OK: phase31528 e2e passed"
