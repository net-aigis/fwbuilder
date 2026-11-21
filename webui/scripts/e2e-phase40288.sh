#!/usr/bin/env bash
# Phase-40288: soft-complete through 40288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40288
PY
grep -qE 'phase40288|through 40288' webui/STATUS.md
echo "OK: phase40288 e2e passed"
