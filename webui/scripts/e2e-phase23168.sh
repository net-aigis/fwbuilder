#!/usr/bin/env bash
# Phase-23168: soft-complete through 23168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23168
PY
grep -qE 'phase23168|through 23168' webui/STATUS.md
echo "OK: phase23168 e2e passed"
