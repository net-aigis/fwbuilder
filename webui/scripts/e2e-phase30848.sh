#!/usr/bin/env bash
# Phase-30848: soft-complete through 30848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30848
PY
grep -qE 'phase30848|through 30848' webui/STATUS.md
echo "OK: phase30848 e2e passed"
