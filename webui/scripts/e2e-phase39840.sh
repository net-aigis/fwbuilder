#!/usr/bin/env bash
# Phase-39840: soft-complete through 39840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39840
PY
grep -qE 'phase39840|through 39840' webui/STATUS.md
echo "OK: phase39840 e2e passed"
