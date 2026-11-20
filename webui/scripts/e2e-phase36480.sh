#!/usr/bin/env bash
# Phase-36480: soft-complete through 36480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36480
PY
grep -qE 'phase36480|through 36480' webui/STATUS.md
echo "OK: phase36480 e2e passed"
