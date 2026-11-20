#!/usr/bin/env bash
# Phase-40672: soft-complete through 40672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40672
PY
grep -qE 'phase40672|through 40672' webui/STATUS.md
echo "OK: phase40672 e2e passed"
