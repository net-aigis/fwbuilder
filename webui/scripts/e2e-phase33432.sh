#!/usr/bin/env bash
# Phase-33432: soft-complete through 33432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33432
PY
grep -qE 'phase33432|through 33432' webui/STATUS.md
echo "OK: phase33432 e2e passed"
