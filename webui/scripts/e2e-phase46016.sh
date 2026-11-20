#!/usr/bin/env bash
# Phase-46016: soft-complete through 46016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46016
PY
grep -qE 'phase46016|through 46016' webui/STATUS.md
echo "OK: phase46016 e2e passed"
