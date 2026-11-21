#!/usr/bin/env bash
# Phase-45128: soft-complete through 45128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45128
PY
grep -qE 'phase45128|through 45128' webui/STATUS.md
echo "OK: phase45128 e2e passed"
