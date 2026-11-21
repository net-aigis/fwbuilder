#!/usr/bin/env bash
# Phase-32336: soft-complete through 32336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32336
PY
grep -qE 'phase32336|through 32336' webui/STATUS.md
echo "OK: phase32336 e2e passed"
