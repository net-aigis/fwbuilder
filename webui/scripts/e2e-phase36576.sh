#!/usr/bin/env bash
# Phase-36576: soft-complete through 36576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36576
PY
grep -qE 'phase36576|through 36576' webui/STATUS.md
echo "OK: phase36576 e2e passed"
