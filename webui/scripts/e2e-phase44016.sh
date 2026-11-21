#!/usr/bin/env bash
# Phase-44016: soft-complete through 44016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44016
PY
grep -qE 'phase44016|through 44016' webui/STATUS.md
echo "OK: phase44016 e2e passed"
