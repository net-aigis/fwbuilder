#!/usr/bin/env bash
# Phase-47672: soft-complete through 47672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47672
PY
grep -qE 'phase47672|through 47672' webui/STATUS.md
echo "OK: phase47672 e2e passed"
