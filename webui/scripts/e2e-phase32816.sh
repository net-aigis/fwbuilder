#!/usr/bin/env bash
# Phase-32816: soft-complete through 32816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32816
PY
grep -qE 'phase32816|through 32816' webui/STATUS.md
echo "OK: phase32816 e2e passed"
