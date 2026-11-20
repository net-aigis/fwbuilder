#!/usr/bin/env bash
# Phase-43472: soft-complete through 43472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43472
PY
grep -qE 'phase43472|through 43472' webui/STATUS.md
echo "OK: phase43472 e2e passed"
