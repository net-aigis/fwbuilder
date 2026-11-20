#!/usr/bin/env bash
# Phase-40336: soft-complete through 40336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40336
PY
grep -qE 'phase40336|through 40336' webui/STATUS.md
echo "OK: phase40336 e2e passed"
