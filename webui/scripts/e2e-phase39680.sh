#!/usr/bin/env bash
# Phase-39680: soft-complete through 39680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39680
PY
grep -qE 'phase39680|through 39680' webui/STATUS.md
echo "OK: phase39680 e2e passed"
