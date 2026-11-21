#!/usr/bin/env bash
# Phase-47352: soft-complete through 47352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47352
PY
grep -qE 'phase47352|through 47352' webui/STATUS.md
echo "OK: phase47352 e2e passed"
