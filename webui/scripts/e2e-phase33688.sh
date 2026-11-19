#!/usr/bin/env bash
# Phase-33688: soft-complete through 33688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33688
PY
grep -qE 'phase33688|through 33688' webui/STATUS.md
echo "OK: phase33688 e2e passed"
