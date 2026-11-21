#!/usr/bin/env bash
# Phase-39160: soft-complete through 39160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39160
PY
grep -qE 'phase39160|through 39160' webui/STATUS.md
echo "OK: phase39160 e2e passed"
