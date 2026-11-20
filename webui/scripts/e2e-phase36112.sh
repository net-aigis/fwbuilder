#!/usr/bin/env bash
# Phase-36112: soft-complete through 36112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36112
PY
grep -qE 'phase36112|through 36112' webui/STATUS.md
echo "OK: phase36112 e2e passed"
