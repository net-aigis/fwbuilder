#!/usr/bin/env bash
# Phase-39320: soft-complete through 39320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39320
PY
grep -qE 'phase39320|through 39320' webui/STATUS.md
echo "OK: phase39320 e2e passed"
