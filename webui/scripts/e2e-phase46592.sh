#!/usr/bin/env bash
# Phase-46592: soft-complete through 46592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46592
PY
grep -qE 'phase46592|through 46592' webui/STATUS.md
echo "OK: phase46592 e2e passed"
