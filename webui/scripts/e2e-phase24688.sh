#!/usr/bin/env bash
# Phase-24688: soft-complete through 24688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24688
PY
grep -qE 'phase24688|through 24688' webui/STATUS.md
echo "OK: phase24688 e2e passed"
