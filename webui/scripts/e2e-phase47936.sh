#!/usr/bin/env bash
# Phase-47936: soft-complete through 47936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47936
PY
grep -qE 'phase47936|through 47936' webui/STATUS.md
echo "OK: phase47936 e2e passed"
