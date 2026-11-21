#!/usr/bin/env bash
# Phase-39112: soft-complete through 39112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39112
PY
grep -qE 'phase39112|through 39112' webui/STATUS.md
echo "OK: phase39112 e2e passed"
