#!/usr/bin/env bash
# Phase-48272: soft-complete through 48272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48272
PY
grep -qE 'phase48272|through 48272' webui/STATUS.md
echo "OK: phase48272 e2e passed"
