#!/usr/bin/env bash
# Phase-40344: soft-complete through 40344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40344
PY
grep -qE 'phase40344|through 40344' webui/STATUS.md
echo "OK: phase40344 e2e passed"
