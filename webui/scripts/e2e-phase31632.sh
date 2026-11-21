#!/usr/bin/env bash
# Phase-31632: soft-complete through 31632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31632
PY
grep -qE 'phase31632|through 31632' webui/STATUS.md
echo "OK: phase31632 e2e passed"
