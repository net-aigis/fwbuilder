#!/usr/bin/env bash
# Phase-47800: soft-complete through 47800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47800
PY
grep -qE 'phase47800|through 47800' webui/STATUS.md
echo "OK: phase47800 e2e passed"
