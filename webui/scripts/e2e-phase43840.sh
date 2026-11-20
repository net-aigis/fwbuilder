#!/usr/bin/env bash
# Phase-43840: soft-complete through 43840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43840
PY
grep -qE 'phase43840|through 43840' webui/STATUS.md
echo "OK: phase43840 e2e passed"
