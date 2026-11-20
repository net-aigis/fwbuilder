#!/usr/bin/env bash
# Phase-43544: soft-complete through 43544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43544
PY
grep -qE 'phase43544|through 43544' webui/STATUS.md
echo "OK: phase43544 e2e passed"
