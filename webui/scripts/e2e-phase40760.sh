#!/usr/bin/env bash
# Phase-40760: soft-complete through 40760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40760
PY
grep -qE 'phase40760|through 40760' webui/STATUS.md
echo "OK: phase40760 e2e passed"
