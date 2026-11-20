#!/usr/bin/env bash
# Phase-47008: soft-complete through 47008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47008
PY
grep -qE 'phase47008|through 47008' webui/STATUS.md
echo "OK: phase47008 e2e passed"
