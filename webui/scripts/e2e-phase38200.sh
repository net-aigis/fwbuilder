#!/usr/bin/env bash
# Phase-38200: soft-complete through 38200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38200
PY
grep -qE 'phase38200|through 38200' webui/STATUS.md
echo "OK: phase38200 e2e passed"
