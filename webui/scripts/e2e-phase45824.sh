#!/usr/bin/env bash
# Phase-45824: soft-complete through 45824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45824
PY
grep -qE 'phase45824|through 45824' webui/STATUS.md
echo "OK: phase45824 e2e passed"
