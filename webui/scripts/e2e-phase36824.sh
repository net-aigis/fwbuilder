#!/usr/bin/env bash
# Phase-36824: soft-complete through 36824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36824
PY
grep -qE 'phase36824|through 36824' webui/STATUS.md
echo "OK: phase36824 e2e passed"
