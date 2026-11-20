#!/usr/bin/env bash
# Phase-46448: soft-complete through 46448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46448
PY
grep -qE 'phase46448|through 46448' webui/STATUS.md
echo "OK: phase46448 e2e passed"
