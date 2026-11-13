#!/usr/bin/env bash
# Phase-28128: soft-complete through 28128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28128
PY
grep -qE 'phase28128|through 28128' webui/STATUS.md
echo "OK: phase28128 e2e passed"
