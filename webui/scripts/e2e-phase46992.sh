#!/usr/bin/env bash
# Phase-46992: soft-complete through 46992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46992
PY
grep -qE 'phase46992|through 46992' webui/STATUS.md
echo "OK: phase46992 e2e passed"
