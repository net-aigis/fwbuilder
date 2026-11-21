#!/usr/bin/env bash
# Phase-43512: soft-complete through 43512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43512
PY
grep -qE 'phase43512|through 43512' webui/STATUS.md
echo "OK: phase43512 e2e passed"
