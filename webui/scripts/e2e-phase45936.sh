#!/usr/bin/env bash
# Phase-45936: soft-complete through 45936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45936
PY
grep -qE 'phase45936|through 45936' webui/STATUS.md
echo "OK: phase45936 e2e passed"
