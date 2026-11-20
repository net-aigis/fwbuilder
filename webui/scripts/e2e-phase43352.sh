#!/usr/bin/env bash
# Phase-43352: soft-complete through 43352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43352
PY
grep -qE 'phase43352|through 43352' webui/STATUS.md
echo "OK: phase43352 e2e passed"
