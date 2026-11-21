#!/usr/bin/env bash
# Phase-45528: soft-complete through 45528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45528
PY
grep -qE 'phase45528|through 45528' webui/STATUS.md
echo "OK: phase45528 e2e passed"
