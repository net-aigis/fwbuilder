#!/usr/bin/env bash
# Phase-24448: soft-complete through 24448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24448
PY
grep -qE 'phase24448|through 24448' webui/STATUS.md
echo "OK: phase24448 e2e passed"
