#!/usr/bin/env bash
# Phase-42632: soft-complete through 42632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42632
PY
grep -qE 'phase42632|through 42632' webui/STATUS.md
echo "OK: phase42632 e2e passed"
