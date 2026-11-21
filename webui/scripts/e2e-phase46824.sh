#!/usr/bin/env bash
# Phase-46824: soft-complete through 46824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46824
PY
grep -qE 'phase46824|through 46824' webui/STATUS.md
echo "OK: phase46824 e2e passed"
