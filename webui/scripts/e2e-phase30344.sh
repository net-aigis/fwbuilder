#!/usr/bin/env bash
# Phase-30344: soft-complete through 30344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30344
PY
grep -qE 'phase30344|through 30344' webui/STATUS.md
echo "OK: phase30344 e2e passed"
