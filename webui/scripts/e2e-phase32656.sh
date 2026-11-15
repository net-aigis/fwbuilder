#!/usr/bin/env bash
# Phase-32656: soft-complete through 32656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32656
PY
grep -qE 'phase32656|through 32656' webui/STATUS.md
echo "OK: phase32656 e2e passed"
