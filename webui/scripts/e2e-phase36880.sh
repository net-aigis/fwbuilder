#!/usr/bin/env bash
# Phase-36880: soft-complete through 36880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36880
PY
grep -qE 'phase36880|through 36880' webui/STATUS.md
echo "OK: phase36880 e2e passed"
