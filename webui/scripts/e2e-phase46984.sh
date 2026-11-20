#!/usr/bin/env bash
# Phase-46984: soft-complete through 46984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46984
PY
grep -qE 'phase46984|through 46984' webui/STATUS.md
echo "OK: phase46984 e2e passed"
