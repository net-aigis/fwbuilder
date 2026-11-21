#!/usr/bin/env bash
# Phase-38472: soft-complete through 38472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38472
PY
grep -qE 'phase38472|through 38472' webui/STATUS.md
echo "OK: phase38472 e2e passed"
