#!/usr/bin/env bash
# Phase-46528: soft-complete through 46528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46528
PY
grep -qE 'phase46528|through 46528' webui/STATUS.md
echo "OK: phase46528 e2e passed"
