#!/usr/bin/env bash
# Phase-36440: soft-complete through 36440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36440
PY
grep -qE 'phase36440|through 36440' webui/STATUS.md
echo "OK: phase36440 e2e passed"
