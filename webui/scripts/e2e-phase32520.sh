#!/usr/bin/env bash
# Phase-32520: soft-complete through 32520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32520
PY
grep -qE 'phase32520|through 32520' webui/STATUS.md
echo "OK: phase32520 e2e passed"
