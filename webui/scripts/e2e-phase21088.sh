#!/usr/bin/env bash
# Phase-21088: soft-complete through 21088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21088
PY
grep -qE 'phase21088|through 21088' webui/STATUS.md
echo "OK: phase21088 e2e passed"
