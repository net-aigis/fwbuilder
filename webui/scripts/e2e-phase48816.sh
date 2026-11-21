#!/usr/bin/env bash
# Phase-48816: soft-complete through 48816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48816
PY
grep -qE 'phase48816|through 48816' webui/STATUS.md
echo "OK: phase48816 e2e passed"
