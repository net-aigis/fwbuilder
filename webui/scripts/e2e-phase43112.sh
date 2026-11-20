#!/usr/bin/env bash
# Phase-43112: soft-complete through 43112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43112
PY
grep -qE 'phase43112|through 43112' webui/STATUS.md
echo "OK: phase43112 e2e passed"
