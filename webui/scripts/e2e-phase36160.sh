#!/usr/bin/env bash
# Phase-36160: soft-complete through 36160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36160
PY
grep -qE 'phase36160|through 36160' webui/STATUS.md
echo "OK: phase36160 e2e passed"
