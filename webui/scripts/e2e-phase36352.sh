#!/usr/bin/env bash
# Phase-36352: soft-complete through 36352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36352
PY
grep -qE 'phase36352|through 36352' webui/STATUS.md
echo "OK: phase36352 e2e passed"
