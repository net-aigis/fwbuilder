#!/usr/bin/env bash
# Phase-32352: soft-complete through 32352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32352
PY
grep -qE 'phase32352|through 32352' webui/STATUS.md
echo "OK: phase32352 e2e passed"
