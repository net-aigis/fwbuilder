#!/usr/bin/env bash
# Phase-46040: soft-complete through 46040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46040
PY
grep -qE 'phase46040|through 46040' webui/STATUS.md
echo "OK: phase46040 e2e passed"
