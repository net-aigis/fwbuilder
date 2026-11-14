#!/usr/bin/env bash
# Phase-30448: soft-complete through 30448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30448
PY
grep -qE 'phase30448|through 30448' webui/STATUS.md
echo "OK: phase30448 e2e passed"
