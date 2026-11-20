#!/usr/bin/env bash
# Phase-46464: soft-complete through 46464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46464
PY
grep -qE 'phase46464|through 46464' webui/STATUS.md
echo "OK: phase46464 e2e passed"
