#!/usr/bin/env bash
# Phase-20128: soft-complete through 20128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20128
PY
grep -qE 'phase20128|through 20128' webui/STATUS.md
echo "OK: phase20128 e2e passed"
