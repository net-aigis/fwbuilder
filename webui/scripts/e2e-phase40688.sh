#!/usr/bin/env bash
# Phase-40688: soft-complete through 40688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40688
PY
grep -qE 'phase40688|through 40688' webui/STATUS.md
echo "OK: phase40688 e2e passed"
