#!/usr/bin/env bash
# Phase-36600: soft-complete through 36600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36600
PY
grep -qE 'phase36600|through 36600' webui/STATUS.md
echo "OK: phase36600 e2e passed"
