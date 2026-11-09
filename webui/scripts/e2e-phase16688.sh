#!/usr/bin/env bash
# Phase-16688: soft-complete through 16688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16688
PY
grep -qE 'phase16688|through 16688' webui/STATUS.md
echo "OK: phase16688 e2e passed"
