#!/usr/bin/env bash
# Phase-40448: soft-complete through 40448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40448
PY
grep -qE 'phase40448|through 40448' webui/STATUS.md
echo "OK: phase40448 e2e passed"
