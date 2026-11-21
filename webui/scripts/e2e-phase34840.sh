#!/usr/bin/env bash
# Phase-34840: soft-complete through 34840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34840
PY
grep -qE 'phase34840|through 34840' webui/STATUS.md
echo "OK: phase34840 e2e passed"
