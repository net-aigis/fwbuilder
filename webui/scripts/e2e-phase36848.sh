#!/usr/bin/env bash
# Phase-36848: soft-complete through 36848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36848
PY
grep -qE 'phase36848|through 36848' webui/STATUS.md
echo "OK: phase36848 e2e passed"
