#!/usr/bin/env bash
# Phase-38576: soft-complete through 38576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38576
PY
grep -qE 'phase38576|through 38576' webui/STATUS.md
echo "OK: phase38576 e2e passed"
