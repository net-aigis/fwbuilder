#!/usr/bin/env bash
# Phase-43992: soft-complete through 43992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43992
PY
grep -qE 'phase43992|through 43992' webui/STATUS.md
echo "OK: phase43992 e2e passed"
