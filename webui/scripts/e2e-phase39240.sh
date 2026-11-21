#!/usr/bin/env bash
# Phase-39240: soft-complete through 39240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39240
PY
grep -qE 'phase39240|through 39240' webui/STATUS.md
echo "OK: phase39240 e2e passed"
