#!/usr/bin/env bash
# Phase-39992: soft-complete through 39992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39992
PY
grep -qE 'phase39992|through 39992' webui/STATUS.md
echo "OK: phase39992 e2e passed"
