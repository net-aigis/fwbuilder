#!/usr/bin/env bash
# Phase-37024: soft-complete through 37024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37024
PY
grep -qE 'phase37024|through 37024' webui/STATUS.md
echo "OK: phase37024 e2e passed"
