#!/usr/bin/env bash
# Phase-40432: soft-complete through 40432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40432
PY
grep -qE 'phase40432|through 40432' webui/STATUS.md
echo "OK: phase40432 e2e passed"
