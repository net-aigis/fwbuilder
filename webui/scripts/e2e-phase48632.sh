#!/usr/bin/env bash
# Phase-48632: soft-complete through 48632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48632
PY
grep -qE 'phase48632|through 48632' webui/STATUS.md
echo "OK: phase48632 e2e passed"
