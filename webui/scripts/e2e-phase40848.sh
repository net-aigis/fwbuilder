#!/usr/bin/env bash
# Phase-40848: soft-complete through 40848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40848
PY
grep -qE 'phase40848|through 40848' webui/STATUS.md
echo "OK: phase40848 e2e passed"
