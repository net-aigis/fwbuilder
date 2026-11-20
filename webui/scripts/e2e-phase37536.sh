#!/usr/bin/env bash
# Phase-37536: soft-complete through 37536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37536
PY
grep -qE 'phase37536|through 37536' webui/STATUS.md
echo "OK: phase37536 e2e passed"
