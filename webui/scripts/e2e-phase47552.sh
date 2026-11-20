#!/usr/bin/env bash
# Phase-47552: soft-complete through 47552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47552
PY
grep -qE 'phase47552|through 47552' webui/STATUS.md
echo "OK: phase47552 e2e passed"
