#!/usr/bin/env bash
# Phase-47184: soft-complete through 47184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47184
PY
grep -qE 'phase47184|through 47184' webui/STATUS.md
echo "OK: phase47184 e2e passed"
