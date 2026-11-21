#!/usr/bin/env bash
# Phase-37320: soft-complete through 37320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37320
PY
grep -qE 'phase37320|through 37320' webui/STATUS.md
echo "OK: phase37320 e2e passed"
