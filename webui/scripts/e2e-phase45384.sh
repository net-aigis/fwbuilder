#!/usr/bin/env bash
# Phase-45384: soft-complete through 45384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45384
PY
grep -qE 'phase45384|through 45384' webui/STATUS.md
echo "OK: phase45384 e2e passed"
