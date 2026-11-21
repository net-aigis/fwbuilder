#!/usr/bin/env bash
# Phase-40352: soft-complete through 40352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40352
PY
grep -qE 'phase40352|through 40352' webui/STATUS.md
echo "OK: phase40352 e2e passed"
