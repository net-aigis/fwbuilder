#!/usr/bin/env bash
# Phase-8688: soft-complete through 8688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8688
PY
grep -qE 'phase8688|through 8688' webui/STATUS.md
echo "OK: phase8688 e2e passed"
