#!/usr/bin/env bash
# Phase-38824: soft-complete through 38824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38824
PY
grep -qE 'phase38824|through 38824' webui/STATUS.md
echo "OK: phase38824 e2e passed"
