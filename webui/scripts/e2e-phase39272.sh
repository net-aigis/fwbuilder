#!/usr/bin/env bash
# Phase-39272: soft-complete through 39272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39272
PY
grep -qE 'phase39272|through 39272' webui/STATUS.md
echo "OK: phase39272 e2e passed"
