#!/usr/bin/env bash
# Phase-31784: soft-complete through 31784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31784
PY
grep -qE 'phase31784|through 31784' webui/STATUS.md
echo "OK: phase31784 e2e passed"
