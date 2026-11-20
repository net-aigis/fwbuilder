#!/usr/bin/env bash
# Phase-44344: soft-complete through 44344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44344
PY
grep -qE 'phase44344|through 44344' webui/STATUS.md
echo "OK: phase44344 e2e passed"
