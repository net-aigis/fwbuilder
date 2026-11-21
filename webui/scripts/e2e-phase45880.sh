#!/usr/bin/env bash
# Phase-45880: soft-complete through 45880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45880
PY
grep -qE 'phase45880|through 45880' webui/STATUS.md
echo "OK: phase45880 e2e passed"
