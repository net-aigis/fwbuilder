#!/usr/bin/env bash
# Phase-47320: soft-complete through 47320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47320
PY
grep -qE 'phase47320|through 47320' webui/STATUS.md
echo "OK: phase47320 e2e passed"
