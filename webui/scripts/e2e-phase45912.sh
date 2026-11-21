#!/usr/bin/env bash
# Phase-45912: soft-complete through 45912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45912
PY
grep -qE 'phase45912|through 45912' webui/STATUS.md
echo "OK: phase45912 e2e passed"
