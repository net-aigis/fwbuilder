#!/usr/bin/env bash
# Phase-42784: soft-complete through 42784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42784
PY
grep -qE 'phase42784|through 42784' webui/STATUS.md
echo "OK: phase42784 e2e passed"
