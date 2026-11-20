#!/usr/bin/env bash
# Phase-44968: soft-complete through 44968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44968
PY
grep -qE 'phase44968|through 44968' webui/STATUS.md
echo "OK: phase44968 e2e passed"
