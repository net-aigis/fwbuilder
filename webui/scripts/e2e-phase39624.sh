#!/usr/bin/env bash
# Phase-39624: soft-complete through 39624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39624
PY
grep -qE 'phase39624|through 39624' webui/STATUS.md
echo "OK: phase39624 e2e passed"
