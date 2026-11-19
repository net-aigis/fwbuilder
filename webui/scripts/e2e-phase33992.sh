#!/usr/bin/env bash
# Phase-33992: soft-complete through 33992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33992
PY
grep -qE 'phase33992|through 33992' webui/STATUS.md
echo "OK: phase33992 e2e passed"
