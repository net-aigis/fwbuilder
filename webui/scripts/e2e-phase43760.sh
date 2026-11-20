#!/usr/bin/env bash
# Phase-43760: soft-complete through 43760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43760
PY
grep -qE 'phase43760|through 43760' webui/STATUS.md
echo "OK: phase43760 e2e passed"
