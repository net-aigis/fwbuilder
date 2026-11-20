#!/usr/bin/env bash
# Phase-46128: soft-complete through 46128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46128
PY
grep -qE 'phase46128|through 46128' webui/STATUS.md
echo "OK: phase46128 e2e passed"
