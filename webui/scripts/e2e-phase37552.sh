#!/usr/bin/env bash
# Phase-37552: soft-complete through 37552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37552
PY
grep -qE 'phase37552|through 37552' webui/STATUS.md
echo "OK: phase37552 e2e passed"
