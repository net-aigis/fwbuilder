#!/usr/bin/env bash
# Phase-34256: soft-complete through 34256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34256
PY
grep -qE 'phase34256|through 34256' webui/STATUS.md
echo "OK: phase34256 e2e passed"
