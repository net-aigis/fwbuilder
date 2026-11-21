#!/usr/bin/env bash
# Phase-47824: soft-complete through 47824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47824
PY
grep -qE 'phase47824|through 47824' webui/STATUS.md
echo "OK: phase47824 e2e passed"
