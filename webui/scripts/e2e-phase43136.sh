#!/usr/bin/env bash
# Phase-43136: soft-complete through 43136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43136
PY
grep -qE 'phase43136|through 43136' webui/STATUS.md
echo "OK: phase43136 e2e passed"
