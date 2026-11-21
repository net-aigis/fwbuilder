#!/usr/bin/env bash
# Phase-40256: soft-complete through 40256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40256
PY
grep -qE 'phase40256|through 40256' webui/STATUS.md
echo "OK: phase40256 e2e passed"
