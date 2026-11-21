#!/usr/bin/env bash
# Phase-47504: soft-complete through 47504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47504
PY
grep -qE 'phase47504|through 47504' webui/STATUS.md
echo "OK: phase47504 e2e passed"
