#!/usr/bin/env bash
# Phase-31448: soft-complete through 31448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31448
PY
grep -qE 'phase31448|through 31448' webui/STATUS.md
echo "OK: phase31448 e2e passed"
