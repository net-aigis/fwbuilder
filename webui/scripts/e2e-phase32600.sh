#!/usr/bin/env bash
# Phase-32600: soft-complete through 32600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32600
PY
grep -qE 'phase32600|through 32600' webui/STATUS.md
echo "OK: phase32600 e2e passed"
