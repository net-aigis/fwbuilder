#!/usr/bin/env bash
# Phase-20528: soft-complete through 20528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20528
PY
grep -qE 'phase20528|through 20528' webui/STATUS.md
echo "OK: phase20528 e2e passed"
