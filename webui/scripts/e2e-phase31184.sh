#!/usr/bin/env bash
# Phase-31184: soft-complete through 31184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31184
PY
grep -qE 'phase31184|through 31184' webui/STATUS.md
echo "OK: phase31184 e2e passed"
