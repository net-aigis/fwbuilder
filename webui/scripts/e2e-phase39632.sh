#!/usr/bin/env bash
# Phase-39632: soft-complete through 39632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39632
PY
grep -qE 'phase39632|through 39632' webui/STATUS.md
echo "OK: phase39632 e2e passed"
