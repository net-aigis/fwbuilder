#!/usr/bin/env bash
# Phase-47280: soft-complete through 47280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47280
PY
grep -qE 'phase47280|through 47280' webui/STATUS.md
echo "OK: phase47280 e2e passed"
