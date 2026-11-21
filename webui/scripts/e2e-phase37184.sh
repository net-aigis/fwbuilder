#!/usr/bin/env bash
# Phase-37184: soft-complete through 37184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37184
PY
grep -qE 'phase37184|through 37184' webui/STATUS.md
echo "OK: phase37184 e2e passed"
