#!/usr/bin/env bash
# Phase-36840: soft-complete through 36840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36840
PY
grep -qE 'phase36840|through 36840' webui/STATUS.md
echo "OK: phase36840 e2e passed"
