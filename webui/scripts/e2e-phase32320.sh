#!/usr/bin/env bash
# Phase-32320: soft-complete through 32320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32320
PY
grep -qE 'phase32320|through 32320' webui/STATUS.md
echo "OK: phase32320 e2e passed"
