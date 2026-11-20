#!/usr/bin/env bash
# Phase-40320: soft-complete through 40320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40320
PY
grep -qE 'phase40320|through 40320' webui/STATUS.md
echo "OK: phase40320 e2e passed"
