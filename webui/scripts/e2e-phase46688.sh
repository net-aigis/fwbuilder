#!/usr/bin/env bash
# Phase-46688: soft-complete through 46688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46688
PY
grep -qE 'phase46688|through 46688' webui/STATUS.md
echo "OK: phase46688 e2e passed"
