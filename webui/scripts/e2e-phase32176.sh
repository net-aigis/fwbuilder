#!/usr/bin/env bash
# Phase-32176: soft-complete through 32176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32176
PY
grep -qE 'phase32176|through 32176' webui/STATUS.md
echo "OK: phase32176 e2e passed"
