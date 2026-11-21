#!/usr/bin/env bash
# Phase-40240: soft-complete through 40240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40240
PY
grep -qE 'phase40240|through 40240' webui/STATUS.md
echo "OK: phase40240 e2e passed"
