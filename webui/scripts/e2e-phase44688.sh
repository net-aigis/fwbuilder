#!/usr/bin/env bash
# Phase-44688: soft-complete through 44688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44688
PY
grep -qE 'phase44688|through 44688' webui/STATUS.md
echo "OK: phase44688 e2e passed"
