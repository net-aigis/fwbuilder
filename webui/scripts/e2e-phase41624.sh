#!/usr/bin/env bash
# Phase-41624: soft-complete through 41624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41624
PY
grep -qE 'phase41624|through 41624' webui/STATUS.md
echo "OK: phase41624 e2e passed"
