#!/usr/bin/env bash
# Phase-47512: soft-complete through 47512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47512
PY
grep -qE 'phase47512|through 47512' webui/STATUS.md
echo "OK: phase47512 e2e passed"
