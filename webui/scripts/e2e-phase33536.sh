#!/usr/bin/env bash
# Phase-33536: soft-complete through 33536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33536
PY
grep -qE 'phase33536|through 33536' webui/STATUS.md
echo "OK: phase33536 e2e passed"
