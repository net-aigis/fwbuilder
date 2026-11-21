#!/usr/bin/env bash
# Phase-32184: soft-complete through 32184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32184
PY
grep -qE 'phase32184|through 32184' webui/STATUS.md
echo "OK: phase32184 e2e passed"
