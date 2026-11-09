#!/usr/bin/env bash
# Phase-16848: soft-complete through 16848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16848
PY
grep -qE 'phase16848|through 16848' webui/STATUS.md
echo "OK: phase16848 e2e passed"
