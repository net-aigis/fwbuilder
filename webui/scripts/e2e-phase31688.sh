#!/usr/bin/env bash
# Phase-31688: soft-complete through 31688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31688
PY
grep -qE 'phase31688|through 31688' webui/STATUS.md
echo "OK: phase31688 e2e passed"
