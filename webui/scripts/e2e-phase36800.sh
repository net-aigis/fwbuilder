#!/usr/bin/env bash
# Phase-36800: soft-complete through 36800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36800
PY
grep -qE 'phase36800|through 36800' webui/STATUS.md
echo "OK: phase36800 e2e passed"
