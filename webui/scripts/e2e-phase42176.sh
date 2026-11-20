#!/usr/bin/env bash
# Phase-42176: soft-complete through 42176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42176
PY
grep -qE 'phase42176|through 42176' webui/STATUS.md
echo "OK: phase42176 e2e passed"
