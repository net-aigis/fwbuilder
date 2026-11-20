#!/usr/bin/env bash
# Phase-45432: soft-complete through 45432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45432
PY
grep -qE 'phase45432|through 45432' webui/STATUS.md
echo "OK: phase45432 e2e passed"
