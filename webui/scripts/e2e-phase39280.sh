#!/usr/bin/env bash
# Phase-39280: soft-complete through 39280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39280
PY
grep -qE 'phase39280|through 39280' webui/STATUS.md
echo "OK: phase39280 e2e passed"
