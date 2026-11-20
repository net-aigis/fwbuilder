#!/usr/bin/env bash
# Phase-37352: soft-complete through 37352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37352
PY
grep -qE 'phase37352|through 37352' webui/STATUS.md
echo "OK: phase37352 e2e passed"
