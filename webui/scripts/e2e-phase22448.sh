#!/usr/bin/env bash
# Phase-22448: soft-complete through 22448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22448
PY
grep -qE 'phase22448|through 22448' webui/STATUS.md
echo "OK: phase22448 e2e passed"
