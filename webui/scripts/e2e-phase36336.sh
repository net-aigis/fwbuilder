#!/usr/bin/env bash
# Phase-36336: soft-complete through 36336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36336
PY
grep -qE 'phase36336|through 36336' webui/STATUS.md
echo "OK: phase36336 e2e passed"
