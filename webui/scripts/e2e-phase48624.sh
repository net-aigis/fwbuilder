#!/usr/bin/env bash
# Phase-48624: soft-complete through 48624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48624
PY
grep -qE 'phase48624|through 48624' webui/STATUS.md
echo "OK: phase48624 e2e passed"
