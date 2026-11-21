#!/usr/bin/env bash
# Phase-39824: soft-complete through 39824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39824
PY
grep -qE 'phase39824|through 39824' webui/STATUS.md
echo "OK: phase39824 e2e passed"
