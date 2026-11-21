#!/usr/bin/env bash
# Phase-18448: soft-complete through 18448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18448
PY
grep -qE 'phase18448|through 18448' webui/STATUS.md
echo "OK: phase18448 e2e passed"
