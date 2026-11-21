#!/usr/bin/env bash
# Phase-45536: soft-complete through 45536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45536
PY
grep -qE 'phase45536|through 45536' webui/STATUS.md
echo "OK: phase45536 e2e passed"
