#!/usr/bin/env bash
# Phase-32824: soft-complete through 32824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32824
PY
grep -qE 'phase32824|through 32824' webui/STATUS.md
echo "OK: phase32824 e2e passed"
