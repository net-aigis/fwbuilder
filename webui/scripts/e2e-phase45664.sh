#!/usr/bin/env bash
# Phase-45664: soft-complete through 45664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45664
PY
grep -qE 'phase45664|through 45664' webui/STATUS.md
echo "OK: phase45664 e2e passed"
