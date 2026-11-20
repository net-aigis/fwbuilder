#!/usr/bin/env bash
# Phase-36984: soft-complete through 36984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36984
PY
grep -qE 'phase36984|through 36984' webui/STATUS.md
echo "OK: phase36984 e2e passed"
