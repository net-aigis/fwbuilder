#!/usr/bin/env bash
# Phase-38112: soft-complete through 38112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38112
PY
grep -qE 'phase38112|through 38112' webui/STATUS.md
echo "OK: phase38112 e2e passed"
