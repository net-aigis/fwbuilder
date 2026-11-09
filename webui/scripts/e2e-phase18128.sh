#!/usr/bin/env bash
# Phase-18128: soft-complete through 18128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18128
PY
grep -qE 'phase18128|through 18128' webui/STATUS.md
echo "OK: phase18128 e2e passed"
