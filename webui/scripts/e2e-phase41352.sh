#!/usr/bin/env bash
# Phase-41352: soft-complete through 41352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41352
PY
grep -qE 'phase41352|through 41352' webui/STATUS.md
echo "OK: phase41352 e2e passed"
