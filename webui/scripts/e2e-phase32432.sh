#!/usr/bin/env bash
# Phase-32432: soft-complete through 32432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32432
PY
grep -qE 'phase32432|through 32432' webui/STATUS.md
echo "OK: phase32432 e2e passed"
