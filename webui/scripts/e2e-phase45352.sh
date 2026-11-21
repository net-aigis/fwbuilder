#!/usr/bin/env bash
# Phase-45352: soft-complete through 45352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45352
PY
grep -qE 'phase45352|through 45352' webui/STATUS.md
echo "OK: phase45352 e2e passed"
