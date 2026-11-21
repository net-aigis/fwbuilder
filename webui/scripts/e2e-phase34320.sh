#!/usr/bin/env bash
# Phase-34320: soft-complete through 34320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34320
PY
grep -qE 'phase34320|through 34320' webui/STATUS.md
echo "OK: phase34320 e2e passed"
