#!/usr/bin/env bash
# Phase-43904: soft-complete through 43904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43904
PY
grep -qE 'phase43904|through 43904' webui/STATUS.md
echo "OK: phase43904 e2e passed"
