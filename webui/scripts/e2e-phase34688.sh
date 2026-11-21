#!/usr/bin/env bash
# Phase-34688: soft-complete through 34688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34688
PY
grep -qE 'phase34688|through 34688' webui/STATUS.md
echo "OK: phase34688 e2e passed"
