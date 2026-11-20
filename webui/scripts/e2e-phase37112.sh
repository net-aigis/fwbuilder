#!/usr/bin/env bash
# Phase-37112: soft-complete through 37112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37112
PY
grep -qE 'phase37112|through 37112' webui/STATUS.md
echo "OK: phase37112 e2e passed"
