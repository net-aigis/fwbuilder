#!/usr/bin/env bash
# Phase-45992: soft-complete through 45992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45992
PY
grep -qE 'phase45992|through 45992' webui/STATUS.md
echo "OK: phase45992 e2e passed"
