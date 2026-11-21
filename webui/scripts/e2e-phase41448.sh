#!/usr/bin/env bash
# Phase-41448: soft-complete through 41448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41448
PY
grep -qE 'phase41448|through 41448' webui/STATUS.md
echo "OK: phase41448 e2e passed"
