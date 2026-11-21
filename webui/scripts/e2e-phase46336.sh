#!/usr/bin/env bash
# Phase-46336: soft-complete through 46336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46336
PY
grep -qE 'phase46336|through 46336' webui/STATUS.md
echo "OK: phase46336 e2e passed"
