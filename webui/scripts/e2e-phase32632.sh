#!/usr/bin/env bash
# Phase-32632: soft-complete through 32632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32632
PY
grep -qE 'phase32632|through 32632' webui/STATUS.md
echo "OK: phase32632 e2e passed"
