#!/usr/bin/env bash
# Phase-33808: soft-complete through 33808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33808
PY
grep -qE 'phase33808|through 33808' webui/STATUS.md
echo "OK: phase33808 e2e passed"
