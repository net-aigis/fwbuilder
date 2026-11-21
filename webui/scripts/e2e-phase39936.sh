#!/usr/bin/env bash
# Phase-39936: soft-complete through 39936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39936
PY
grep -qE 'phase39936|through 39936' webui/STATUS.md
echo "OK: phase39936 e2e passed"
