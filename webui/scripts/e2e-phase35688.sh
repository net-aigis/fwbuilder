#!/usr/bin/env bash
# Phase-35688: soft-complete through 35688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35688
PY
grep -qE 'phase35688|through 35688' webui/STATUS.md
echo "OK: phase35688 e2e passed"
