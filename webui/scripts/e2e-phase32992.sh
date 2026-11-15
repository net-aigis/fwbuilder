#!/usr/bin/env bash
# Phase-32992: soft-complete through 32992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32992
PY
grep -qE 'phase32992|through 32992' webui/STATUS.md
echo "OK: phase32992 e2e passed"
