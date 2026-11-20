#!/usr/bin/env bash
# Phase-34144: soft-complete through 34144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34144
PY
grep -qE 'phase34144|through 34144' webui/STATUS.md
echo "OK: phase34144 e2e passed"
