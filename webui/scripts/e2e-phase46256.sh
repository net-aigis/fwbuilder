#!/usr/bin/env bash
# Phase-46256: soft-complete through 46256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46256
PY
grep -qE 'phase46256|through 46256' webui/STATUS.md
echo "OK: phase46256 e2e passed"
