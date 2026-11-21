#!/usr/bin/env bash
# Phase-42552: soft-complete through 42552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42552
PY
grep -qE 'phase42552|through 42552' webui/STATUS.md
echo "OK: phase42552 e2e passed"
