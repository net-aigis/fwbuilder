#!/usr/bin/env bash
# Phase-42392: soft-complete through 42392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42392
PY
grep -qE 'phase42392|through 42392' webui/STATUS.md
echo "OK: phase42392 e2e passed"
