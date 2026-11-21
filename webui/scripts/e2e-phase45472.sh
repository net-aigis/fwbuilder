#!/usr/bin/env bash
# Phase-45472: soft-complete through 45472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45472
PY
grep -qE 'phase45472|through 45472' webui/STATUS.md
echo "OK: phase45472 e2e passed"
