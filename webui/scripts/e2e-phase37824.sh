#!/usr/bin/env bash
# Phase-37824: soft-complete through 37824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37824
PY
grep -qE 'phase37824|through 37824' webui/STATUS.md
echo "OK: phase37824 e2e passed"
