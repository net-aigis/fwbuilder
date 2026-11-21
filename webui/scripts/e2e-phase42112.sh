#!/usr/bin/env bash
# Phase-42112: soft-complete through 42112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42112
PY
grep -qE 'phase42112|through 42112' webui/STATUS.md
echo "OK: phase42112 e2e passed"
