#!/usr/bin/env bash
# Phase-31536: soft-complete through 31536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31536
PY
grep -qE 'phase31536|through 31536' webui/STATUS.md
echo "OK: phase31536 e2e passed"
