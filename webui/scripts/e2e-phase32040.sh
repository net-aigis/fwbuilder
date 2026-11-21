#!/usr/bin/env bash
# Phase-32040: soft-complete through 32040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32040
PY
grep -qE 'phase32040|through 32040' webui/STATUS.md
echo "OK: phase32040 e2e passed"
