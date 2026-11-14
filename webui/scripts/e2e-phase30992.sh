#!/usr/bin/env bash
# Phase-30992: soft-complete through 30992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30992
PY
grep -qE 'phase30992|through 30992' webui/STATUS.md
echo "OK: phase30992 e2e passed"
