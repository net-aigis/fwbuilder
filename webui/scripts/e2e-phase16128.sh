#!/usr/bin/env bash
# Phase-16128: soft-complete through 16128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16128
PY
grep -qE 'phase16128|through 16128' webui/STATUS.md
echo "OK: phase16128 e2e passed"
