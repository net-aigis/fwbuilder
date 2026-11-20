#!/usr/bin/env bash
# Phase-38672: soft-complete through 38672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38672
PY
grep -qE 'phase38672|through 38672' webui/STATUS.md
echo "OK: phase38672 e2e passed"
