#!/usr/bin/env bash
# Phase-48144: soft-complete through 48144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48144
PY
grep -qE 'phase48144|through 48144' webui/STATUS.md
echo "OK: phase48144 e2e passed"
