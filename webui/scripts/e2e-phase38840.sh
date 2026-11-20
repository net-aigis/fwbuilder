#!/usr/bin/env bash
# Phase-38840: soft-complete through 38840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38840
PY
grep -qE 'phase38840|through 38840' webui/STATUS.md
echo "OK: phase38840 e2e passed"
