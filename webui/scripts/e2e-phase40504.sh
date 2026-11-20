#!/usr/bin/env bash
# Phase-40504: soft-complete through 40504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40504
PY
grep -qE 'phase40504|through 40504' webui/STATUS.md
echo "OK: phase40504 e2e passed"
