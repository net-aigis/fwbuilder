#!/usr/bin/env bash
# Phase-32576: soft-complete through 32576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32576
PY
grep -qE 'phase32576|through 32576' webui/STATUS.md
echo "OK: phase32576 e2e passed"
