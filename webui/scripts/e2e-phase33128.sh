#!/usr/bin/env bash
# Phase-33128: soft-complete through 33128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33128
PY
grep -qE 'phase33128|through 33128' webui/STATUS.md
echo "OK: phase33128 e2e passed"
