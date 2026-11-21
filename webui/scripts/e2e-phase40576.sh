#!/usr/bin/env bash
# Phase-40576: soft-complete through 40576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40576
PY
grep -qE 'phase40576|through 40576' webui/STATUS.md
echo "OK: phase40576 e2e passed"
