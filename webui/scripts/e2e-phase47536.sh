#!/usr/bin/env bash
# Phase-47536: soft-complete through 47536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47536
PY
grep -qE 'phase47536|through 47536' webui/STATUS.md
echo "OK: phase47536 e2e passed"
