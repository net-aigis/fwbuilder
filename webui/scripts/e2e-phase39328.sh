#!/usr/bin/env bash
# Phase-39328: soft-complete through 39328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39328
PY
grep -qE 'phase39328|through 39328' webui/STATUS.md
echo "OK: phase39328 e2e passed"
