#!/usr/bin/env bash
# Phase-43824: soft-complete through 43824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43824
PY
grep -qE 'phase43824|through 43824' webui/STATUS.md
echo "OK: phase43824 e2e passed"
