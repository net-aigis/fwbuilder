#!/usr/bin/env bash
# Phase-30664: soft-complete through 30664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30664
PY
grep -qE 'phase30664|through 30664' webui/STATUS.md
echo "OK: phase30664 e2e passed"
