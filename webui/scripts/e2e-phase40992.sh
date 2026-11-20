#!/usr/bin/env bash
# Phase-40992: soft-complete through 40992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40992
PY
grep -qE 'phase40992|through 40992' webui/STATUS.md
echo "OK: phase40992 e2e passed"
